class EndUsersController < ApplicationController
before_action :authenticate_end_user!, only: [:show, :edit]

	def show
		if
		@end_user = current_end_user
		@orders = Oder.where(end_user_id: current_end_user.id)
	end

	def edit
	end

	def update
	end

end
