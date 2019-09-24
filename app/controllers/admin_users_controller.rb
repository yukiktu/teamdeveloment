class AdminUsersController < ApplicationController

	def index
		#@end_user_home = current_end_user.last_name + current_end_user.first_name
		@end_users = EndUser.all
		@end_users = EndUser.page(params[:page]).per(20).order(:id)


	end

	def show
		@end_users = current_end_user
		order_items = OrderItem.all
		order_ids = []
		order_items.each do |oi|
			order_ids.push(oi.order_id)
		end
		@orders = Order.where(end_user_id: current_end_user.id, id: order_ids)
		@pages = Order.all.order(created_at: :desc)
		@pages = Order.page(params[:page]).per(4)
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
		@items = Item.all
		@items = Item.page(params[:page]).per(20).order(:id)
		@orders = Order.where(delivery_status: 1)
		@arrivals = Arrival.where(arrival_status: "入荷済")
		#@arrivals = Arrival.find(:item_id)
	    # if @label_id.nil?
	    #   redirect_to items_path
	    #   #@label.id = 1
	    # else
	    #@label = Label.find_by(@label)#@label_id)
	    # end
	    #@genre = Genre.find_by(@item)
	    #@artist = Artist.find_by(@artist)

	    #@artists = Artist.find(id: @items.artist)
	    #↑初期に作ったテーブルがnullなのでそれを削除すると使えます
	    #arrival = Arrival.where(item_id: @items)
	    #if arrival.present?
	    #else
	      #@arrivals = Arrival.new
	      #@arrivals.arrival_count = '0'
	      #@arrivals.arrival_expected_date = ""
	    #end
	end

end

private

	def end_user_params
 		params.require(:end_user).permit(:emial, :encrypted_password, :last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number, :enrollment_status)
 	end

 	def delivery_address_params
		params.require(:delivery_adress).permit(:end_user_id, :addressee, :postal_code, :address, :phone_number)
	end

