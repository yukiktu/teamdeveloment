class OrdersController < ApplicationController

	def index
		if currentuser.id == admin_users.id
			@order = Order.all
			@order_items = Order_item.where(order_id: Order.id)
			@s_option = Order.delivery_status
		elsif currentuser.present?
			@order = Order.find(currentuser.id)
			@order_items = Order_item.where(order_id: Order.id)
		else
			flash[:notice] = "nothing user"
			redirect_to index
		end
	end

	def new

	end

	def update

	end

	def destroy

	end

	def create

	end

	private
	def order_params
		params


end
