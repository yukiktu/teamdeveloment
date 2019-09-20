class EndUsersController < ApplicationController
before_action :authenticate_end_user!, only: [:show, :edit]

	def show
		# if
		@end_users = current_end_user
		order_items = OrderItem.all
		order_ids = []
		order_items.each do |oi|
			order_ids.push(oi.order_id)
		end
		@orders = Order.where(end_user_id: current_end_user.id, id: order_ids)
		@pages = Order.all.order(created_at: :desc)
		@pages = Order.page(params[:page]).per(4)
		# end
	end

	def edit
	end

	def update
	end

end
