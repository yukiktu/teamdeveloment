class OrdersController < ApplicationController

before_action :authenticate_end_user!, only: [:create, :new]
before_action :authenticate_admin!, only: [:index, :sales]
	def get_stok(item)
		order_total = 0
		order_items = OrderItem.all
		order_id = []
		if order_items.present?
			order_items.each do |orderitem|
				order_id.push(orderitem.order_id)
			end
			orders = Order.where(id: order_id)
	        orders.each do |order|
	                orderitem = order.order_items.find_by(item_id: item.id)
	        	if orderitem.present?
	                orderitemcount = orderitem.item_count
	                order_total = order_total + orderitemcount
	            end
	        end
	    end
        arrival_total = 0
        arrivals = item.arrivals
        if arrivals.present?
    		arrivals.each do |arrival|
	        	item_arrival_count = arrival.arrival_count
	            arrival_total = arrival_total + item_arrival_count
	        end
    	end
        @stock = arrival_total - order_total
	end

	def index
		orderitems = OrderItem.all
		order_id = []
		orderitems.each{|oi|
			order_id.push(oi.order_id)
		}
		order_id.uniq
		#@cart_items = CartItem.where(end_user_id: current_admin.id)
		@orders = Order.where(id: order_id).order(:delivery_status)
		# @order = Order.find(params[:id])
		@end_users = EndUser.all
	end

	def sales
		@items = Item.all
    	#@orders = Order.where(delivery_status: 1)
    	#@arrivals = Arrival.where(arrival_status: "入荷済")
		if params[:date].nil? or params[:date] == "全期間"
			@arrivals = Arrival.where(arrival_status: "入荷済")
			@orders = Order.where(delivery_status: 1)
			# 入荷代金総計の計算
			@d_month = "全期間"
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
    	else
    		# 入荷代金総計の計算
			@month = params[:date]
			@d_month = (@month.to_date).strftime('%Y/%m')
			#@d_month
			#p !!!!!!!!!!!!
			#p @month
			#binding.pry
			@orders = Order.where(delivery_status: 1, updated_at: Time.parse(@month).beginning_of_month..Time.parse(@month).end_of_month)
    		@arrivals = Arrival.where(arrival_status: "入荷済", updated_at: Time.parse(@month).beginning_of_month..Time.parse(@month).end_of_month)
    		#, update_at: @month.month.all_month)
    		total_cost = 0
    		@arrivals.each do |a|
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
    	end
    		m_terms=["全期間"]
    		d_terms=["全期間"]
    		@m_terms=[]
			@arrivals.zip(@orders).each do |arrival, order|
  				m = arrival.updated_at
  				unless d_terms.include?(m.strftime('%Y/%m'))
  					m_terms.push(m)
  					d_terms.push(m.strftime('%Y/%m'))
  				end
  				m = order.updated_at
  				unless d_terms.include?(m.strftime('%Y/%m'))
  					m_terms.push(m)
  					d_terms.push(m.strftime('%Y/%m'))
  				end
	    	end
	    	m_terms.zip(d_terms).each do |m, d|
	    		@m_terms.push([d, m])
	    	end
 	end

	def new
		@delivery_addressee = DeliveryAdress.where(end_user_id: current_end_user.id)
		@end_user_home = current_end_user.last_name + current_end_user.first_name
		@end_user_homes = current_end_user.postal_code
		@end_user_homess = current_end_user.address

	end

	def edit
		@cart_items = CartItem.where(end_user_id: current_end_user.id)
		@order = Order.find(params[:id])
	end

	def update
		if admin_signed_in?
			@order = Order.find(params[:id])
			@order.update(order_params)
			redirect_to orders_path
		elsif end_user_signed_in?
			@order = Order.find(params[:id])
			@order.shipping_fee = (ShippingFee.last).shipping_fee
			@order.update(order_params)
			cart_items = CartItem.where(end_user_id: current_end_user.id)
			cart_items.each do |c|
				order_items = OrderItem.new
				item = Item.find(c.item_id)
				order_items.order_id = @order.id
				order_items.item_name = item.item_name
				artist = Artist.find_by(id: item.artist_id)
				order_items.artist_name = artist.artist_name
				order_items.item_count = c.item_count
				order_items.list_price = item.list_price
				order_items.item_id = item.id
				order_items.tax_rate = (TaxRate.last).tax_rate
				if item.sales_status == "停止中"
					redirect_to cart_items_path
				elsif order_items.save
					c.delete
				end
				@item = Item.find(c.item_id)
				get_stok(@item)
				if @stok.to_i < 1
					@item.sales_status = "停止中"
					@item.save
				end
			end
			redirect_to current_end_user
		else
		end
	end

	def destroy
		@order = Order.find(params[:id])
		@order.delete
		redirect_to cart_items_path
	end

	def create
		order = Order.new(order_params)
		order.end_user_id = current_end_user.id
		if order.addressee == current_end_user.last_name + current_end_user.first_name
			order.postal_code = current_end_user.postal_code
			order.address = current_end_user.address
			order.phone_number = current_end_user.phone_number
		elsif order.address.present?
			if DeliveryAdress.where(end_user_id: current_end_user.id, addressee: order.addressee).empty?
				new_addressee = DeliveryAdress.new
				new_addressee.addressee = order.addressee
				new_addressee.end_user_id = current_end_user.id
				new_addressee.postal_code = order.postal_code
				new_addressee.address = order.address
				new_addressee.phone_number = order.phone_number
				new_addressee.save
			end
		else
			delivery_addressee = DeliveryAdress.find_by(addressee: order.addressee, end_user_id: current_end_user.id)
			order.postal_code = delivery_addressee.postal_code
			order.address = delivery_addressee.address
			order.phone_number = delivery_addressee.phone_number
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
