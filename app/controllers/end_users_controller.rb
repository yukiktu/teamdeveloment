class EndUsersController < ApplicationController
before_action :authenticate_end_user!, only: [:show, :edit]

	def show
		# if
		@end_users = current_end_user
		@orders = Order.where(end_user_id: current_end_user.id)

		@pages = Order.all.order(created_at: :desc)
		@pages = Order.page(params[:page]).per(4)
		# end
	end

	def edit
		@end_user = EndUser.find(params[:id])
		if @end_user.id != current_end_user.id
			redirect_to end_user_path(current_end_user.id)
		end
	end

	def update
		@end_user = EndUser.find(params[:id])
		if @end_user.update(end_user_params)
			redirect_to end_user_path(@end_user.id)
		else
			render :edit
	end
end
end

