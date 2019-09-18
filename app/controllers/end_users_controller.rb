class EndUsersController < ApplicationController
before_action :authenticate_end_user!, only: [:show, :edit]

	def show
		@end_users = current_end_user
		@orders = Order.where(end_user_id: current_end_user.id)
	end

	def edit
	end

	def update
	end

end
