class EndUsersController < ApplicationController
before_action :authenticate_end_user!, only: [:show, :edit]

	def show
		@end_users = current_end_user

			order_items = OrderItem.all
			order_ids = []
			order_items.each do |oi|
				order_ids.push(oi.order_id)
			end

			@orders = Order.where(end_user_id: current_end_user.id, id: order_ids).order(id: :desc).page(params[:page]).per(5).order(:id)

	end

	def edit
		@end_user = EndUser.find(params[:id])
		@delivery_adresses = DeliveryAdress.where(end_user_id: @end_user)
		if @end_user.id != current_end_user.id
			redirect_to end_user_path(current_end_user.id)
		end
	end

	def update
		@end_user = EndUser.find(params[:id])
		@delivery_adresses = DeliveryAdress.where(end_user_id: @end_user)
		if @end_user.update(end_user_params)
			if @end_user.enrollment_status == 0
				destroy_end_user_session_path
				return
			end
			if @delivery_adresses.present?
				@delivery_adresses.update(delivery_address_params)
				redirect_to end_user_path(@end_user.id)
			else
				redirect_to end_user_path(@end_user.id)
			end
		else
			render :edit
		end
	end

private

	def end_user_params
 		params.require(:end_user).permit(:emial, :encrypted_password, :last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number, :enrollment_status)
 	end

 	def delivery_address_params
		params.require(:delivery_adress).permit(:end_user_id, :addressee, :postal_code, :address, :phone_number)
	end

end

