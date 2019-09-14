class OrdersController < ApplicationController

	def index
		# if currentuser.id == admin_users.id
		# 	@order = Order.all
		# 	@order_items = Order_item.where(order_id: Order.id)
		# 	@s_option = Order.delivery_status
		# elsif currentuser.present?
		# 	@order = Order.find(currentuser.id)
		# 	@order_items = Order_item.where(order_id: Order.id)
		# else
		# 	flash[:notice] = "nothing user"
		# 	redirect_to index
		# end
	end

	def new
		@payment_methods = Order.new(order_params)
		@payment_methods.end_user_id = currentuser.id
		@addressee = Delivery_address.new(delivery_address_params)
		@addressee.end_user_id = currentuser.id
	end

	def update

	end

	def destroy
		@payment_methods.delete
		#@addressee.delete
	end

	def create
		@payment_methods.save
		@addressee.save
	end

	private
	def order_params
		params.require(:order).permit(:end_user_id, :addressee, :postal_code, :adress, :phone_number, :payment_methods, :subtotal, :shipping_fee, :grand_total)
	end
	def delivery_address_params
		params.require(:delivery_address).permit(:end_user_id, :addressee, :postal_code, :address, :phone_number)
	end


end
