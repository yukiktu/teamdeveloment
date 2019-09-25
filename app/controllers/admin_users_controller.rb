class AdminUsersController < ApplicationController

	def index
		#@end_user_home = current_end_user.last_name + current_end_user.first_name
		@end_users = EndUser.all.page(params[:page]).per(20).order(:id)


	end

	def search
        @items = Item.where(item_name: params[:search]).page(params[:page]).per(20).order(:id)
        @orders = Order.where(delivery_status: 1)
        @arrivals = Arrival.where(arrival_status: "入荷済")

        render :itiran
  end

	def show
		@end_users = EndUser.find(params[:id])
		order_items = OrderItem.all
		order_ids = []
		order_items.each do |oi|
			order_ids.push(oi.order_id)
		end
		@orders = Order.where(end_user_id: @end_users.id, id: order_ids).page(params[:page]).per(5).order(:id)

		#@pages = Order.all.order(created_at: :desc)
		#@pages = Order.page(params[:page]).per(4)
	end

	def edit
		@end_user = EndUser.find(params[:id])
		@delivery_adresses = DeliveryAdress.where(end_user_id: @end_user)
	end

	def update
		@end_user = EndUser.find(params[:id])
		@delivery_adresses = DeliveryAdress.where(end_user_id: @end_user)
		if @end_user.update(end_user_params)
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

	def itiran
		@items = Item.all.page(params[:page]).per(20).order(:id)
		@orders = Order.where(delivery_status: 1)
		@arrivals = Arrival.where(arrival_status: "入荷済")
	end

end

private

	def end_user_params
 		params.require(:end_user).permit(:emial, :encrypted_password, :last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number, :enrollment_status)
 	end

 	def delivery_address_params
		params.require(:delivery_adress).permit(:end_user_id, :addressee, :postal_code, :address, :phone_number)
	end

