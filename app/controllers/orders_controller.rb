class OrdersController < ApplicationController
before_action :authenticate_end_user!
#before_action :authenticate_admin_user!, only: [:index]
	def index
		@oders = Order.all
		@end_users = EndUser.all
	end

	def sales
		#binding.pry
		@items = Item.all
    	@orders = Order.where(delivery_status: 1)
    	# 入荷代金総計の計算
    	arrivals = Arrival.where(arrival_status: "入荷済")
    	total_cost = 0
    	arrivals.each do |a|
    		cost = a.item.cost_price
    		count = a.arrival_count
    		total_cost = total_cost + cost*count
    	end
    	@total_cost = total_cost
    	# 売上総利益
    	totalgain = 0
    	@orders.each do |o|
    		orderitems = OrderItem.where(order_id: o.id)
    		orderitems.each do |i|
    			totalgain = totalgain + i.list_price*i.item_count
    		end
    	end
    	@totalgain = totalgain




    	#@term= [[]]
  	end

	def new
		#@order = Order.new
		#@order.end_user_id = current_end_user.id
		@delivery_addressee = DeliveryAdress.where(end_user_id: current_end_user.id)
		#@new_addressee = DeliveryAdress.new
		#@new_addressee.end_user_id = current_end_user.id
		@end_user_home = current_end_user.last_name + current_end_user.first_name
		#binding.pry
	end

	def edit
		@cart_items = CartItem.where(end_user_id: current_end_user.id)
		@order = Order.find(params[:id])
	end

	def update
		#@user = EndUser.fnd(parms[:id])
		if admin_user_signed_in?
			@order = Order.find(params[:id])
			@order.update(order_params)
			redirect_to orders_path
		elsif end_user_signed_in?#@user.id == current_end_user.idエンドユーザーのみ
			@order = Order.find(params[:id])
			@order.shipping_fee = (ShippingFee.last).shipping_fee
			@order.update(order_params)
			cart_items = CartItem.where(end_user_id: current_end_user.id)
			cart_items.each do |c|
				order_items = OrderItem.new#(order_item_params)
				item = Item.find(c.item_id)
				order_items.order_id = @order.id
				order_items.item_name = item.item_name
				artist = Artist.find_by(id: item.artist_id)
				order_items.artist_name = artist.artist_name
				order_items.item_count = c.item_count
				order_items.list_price = item.list_price
				order_items.tax_rate = (TaxRate.last).tax_rate
				#binding.pry
				if order_items.save
					c.delete
				end
			end
			redirect_to current_end_user
		else
		end
	end

	def destroy
	end

	def create
		order = Order.new(order_params)
		order.end_user_id = current_end_user.id
		#new_addressee = DeliveryAddress.new(delivery_address_params)
		# if new_addressee.blank?
		# else
		# 	new_addressee.save
		# end
		if order.addressee == current_end_user.last_name + current_end_user.first_name
			order.postal_code = current_end_user.postal_code
			order.address = current_end_user.address
			order.phone_number = current_end_user.phone_number
		elsif order.address.present?
			if DeliveryAdress.where(end_user_id: current_end_user.id, addressee: order.addressee).empty?
				new_addressee = DeliveryAdress.new#(delivery_address_params)
				new_addressee.addressee = order.addressee
				new_addressee.end_user_id = current_end_user.id
				new_addressee.postal_code = order.postal_code
				new_addressee.address = order.address
				new_addressee.phone_number = order.phone_number
				new_addressee.save
			end
		else
			delivery_addressee = DeliveryAdress.find_by(addressee: order.addressee, end_user_id: current_end_user.id)
			#binding.pry
			order.postal_code = delivery_addressee.postal_code
			order.address = delivery_addressee.address
			order.phone_number = delivery_addressee.phone_number
			# order.subtotal = 0 #not_null回避のため
			# grand_total = 0 #not_nul回避のため
			# delivery_status = 0 #not_nul回避のため
		end
		order.shipping_fee = 0
		order.grand_total = 0 #not_nul回避のため
		order.delivery_status = 0 #not_nul回避のため
		order.subtotal = 0 #not_null回避のため
		if order.save
			redirect_to edit_order_path(order.id)
		else
			render :new
		end
	end

	private

	def order_params
		params.require(:order).permit(:end_user_id, :addressee, :postal_code, :address, :phone_number, :payment_methods, :subtotal, :shipping_fee, :grand_total, :delivery_status, :new_addressee)
	end

	def delivery_address_params
		params.require(:delivery_address).permit(:end_user_id, :addressee, :postal_code, :address, :phone_number)
	end


end
