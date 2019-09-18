class OrdersController < ApplicationController
before_action :authenticate_end_user!
#before_action :authenticate_admin_user!, only: [:index]
	def index
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
		order = Order.find(params[:id])
		order.update
		cart_items = CartItem.where(end_user_id: current_end_user.id)
		cart_items.each do |c|
			order_items = OrderItems.new(order_item_params)
			item = Item.find(c.item_id)
			order_items.order_id = order.id
			order_items.item_name = c.item_name
			order_items.artist_name = Artist.find_by(id: item.artist_id)
			order_items.item_count = c.item_count
			order_items.list_price = item.list_price
			order_items.tax_rate = TaxRate.find(1)
		end
		if order_items.save
			cart_items.delete
			redirect_to current_end_user
		else
			render :new
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
			new_addressee = DeliveryAdress.new(delivery_address_params)
			new_addressee.addressee = order.addressee
			new_addressee.end_user_id = current_end_user.id
			new_addressee.postal_code = order.postal_code
			new_addressee.address = order.addressee
			new_addressee.phone_number = order.phone_number
			new_addressee.save
		else
			delivery_addressee = DeliveryAdress.where(addressee: order.addressee, end_user_id: current_end_user.id)
			order.postal_code = delivery_addressee.postal_code
			order.address = delivery_addressee.adress
			order.phone_number = delivery_addressee.phone_number
			# order.subtotal = 0 #not_null回避のため
			# grand_total = 0 #not_nul回避のため
			# delivery_status = 0 #not_nul回避のため
		end
		order.shipping_fee = ShippingFee.find(1)
		order.grand_total = 0 #not_nul回避のため
		order.delivery_status = 0 #not_nul回避のため
		order.subtotal = 0 #not_null回避のため
		binding.pry
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
