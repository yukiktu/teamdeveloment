class LabelsController < ApplicationController
#before_action :authenticate_admin_user!

	def new
		@label = Label.new
		@genre = Genre.new
		@artist = Artist.new
		@item = Item.new
	end

	def create
		#binding.pry
		if Artist.where(artist_name: artist_params["artist_name"]).empty?
			@artist = Artist.new(artist_params)
			@artist.save
		else
			@artist = Artist.find_by(artist_name: artist_params["artist_name"])
		end

		if Genre.where(genre_name: genre_params["genre_name"]).empty?
			@genre = Genre.new(genre_params)
			@genre.save
		else
			@genre = Genre.find_by(genre_name: genre_params["genre_name"])
		end

		if Label.where(label_name: label_params["label_name"]).empty?
			@label = Label.new(label_params)
			@label.save
		else
			@label = Label.find_by(label_name: label_params["label_name"])
		end

		 # binding.pry
		@item = Item.new(item_params)
		# @item.id = 1
		 @item.artist_id = @artist.id
		 @item.genre_id = @genre.id
		 @item.label_id = @label.id
		@item.save
		#session[:temp_artist_name] = @artist.artist_name#params[:artist]
		#binding.pry
		redirect_to edit_item_path(@item)
	end

	private
		def artist_params
			params.require(:artist).permit(:artist_name)
		end

		def label_params
    		params.require(:label).permit(:label_name)
  		end

  		def genre_params
  			params.require(:genre).permit(:genre_name)
  		end

  		def item_params
  			params.require(:item).permit(:item_name, :artist_id, :label_id, :genre_id)
  		end
  		# def item_params
    #  		params.require(:item).permit(
    #   		:item_name,:list_price,:cost_price,:sales_status,:genre_id,:artist_id,:label_id,:release_date,
    #   		:jacket_number,gacket_images:[],discs_attributes:[:id,:disc_name,:disc_number,
    #   		songs_attributes:[:id,:recording_number,:song_title,:play_time]])
    # 	end

end