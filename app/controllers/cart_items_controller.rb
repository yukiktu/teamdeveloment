class CartItemsController < ApplicationController
before_action :authenticate_end_user!

	def get_stock(item)
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
        return @stock
	end

	def index
		@cart_items = CartItem.where(end_user_id: current_end_user.id)
	end

	def create
		cart_item = CartItem.find_by(end_user_id: current_end_user.id, item_id: cart_item_params["item_id"])
		if cart_item.blank?
			cart_item = CartItem.new(cart_item_params)
			cart_item.item_count = 1
		else
			cart_item.item_count +=1
		end
		cart_item.end_user_id = current_end_user.id
		cart_item.save
		redirect_to cart_items_path
	end

	def update
		i = CartItem.find(params[:id])
		i.update(cart_items_params)
		if i.item_count == 0
			i.delete
		end
		redirect_to cart_items_path
	end

	def destroy
		@cart_item.delete
	end


	helper_method :get_stock

	private

		def cart_item_params
			params.require(:cart_items).permit(:end_user_id, :item_count, :item_id)
		end

		def cart_items_params
			params.require(:cart_item).permit(:end_user_id, :item_count, :item_id)
		end
end