class AdminUsersController < ApplicationController

	def index
		#@end_user_home = current_end_user.last_name + current_end_user.first_name
		@end_users = EndUser.all.page(params[:page]).per(20).order(:id)
	end
  def itemkensaku
    if params[:keywords].blank?
      redirect_to itiran_path
      return
    end
    keywords = params[:keywords]
    terms = keywords.split
    term2=[]
    terms.each do |term|
      term2 = term2 + term.split("　")
    end
    keywords = term2
    keywords.uniq!
    keywords.each do |keyword|
      searchword = "%" + keyword.to_s + "%"
        items = Item.where(sales_status: "販売中").where('item_name LIKE ?', searchword)
        artist_id = Artist.where('artist_name LIKE ?', searchword).present?
        artists = Item.where(sales_status: "販売中").where(artist_id: artist_id)
        genre_id = Genre.where('genre_name LIKE ?', searchword)
        genres = Item.where(sales_status: "販売中").where(genre_id: genre_id)
        @items = items + artists + genres
        @items.uniq!
        @items = Kaminari.paginate_array(@items).page(params[:page]).per(12)
    end
    @orders = Order.where(delivery_status: 1)
    @arrivals = Arrival.where(arrival_status: "入荷済")
    render 'itiran'
  end

  def search
    if params[:keywords].blank?
      redirect_to admin_users_path
      return
    end
    keywords = params[:keywords]
    terms = keywords.split
    term2=[]
    terms.each do |term|
      term2 = term2 + term.split("　")
    end
    keywords = term2
    keywords.uniq!
    keywords.each do |keyword|
      searchword = "%" + keyword.to_s + "%"
        result1 = EndUser.where('first_name LIKE ?', searchword)
        result2 = EndUser.where('last_name LIKE ?', searchword)
        result3 = EndUser.where('kana_last_name LIKE ?', searchword)
        result4 = EndUser.where('kana_first_name LIKE ?', searchword)
        result5 = EndUser.where('phone_number LIKE ?', searchword)
        result6 = EndUser.where('email LIKE ?', searchword)
        @end_users = result1 + result2 + result3 + result4 + result5 + result6
        @end_users.uniq!
        @end_users = Kaminari.paginate_array(@end_users).page(params[:page]).per(12)
    end
    render 'index'
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

