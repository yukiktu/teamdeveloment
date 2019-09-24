class AdminUsersController < ApplicationController

	def index
		#@end_user_home = current_end_user.last_name + current_end_user.first_name
		@end_users = EndUser.all

	end

	def show
		@end_user = EndUser.find(params[:id])
		@orders = Order.where(end_user_id: current_end_user.id)

		@pages = Order.all.order(created_at: :desc)
		@pages = Order.page(params[:page]).per(4)

	end

	def itiran
		@items = Item.all
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

	def syousai
		@item = Item.find(params[:id])

	end

end
