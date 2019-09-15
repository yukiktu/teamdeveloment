class LabelsController < ApplicationController

	def new
		@label = Label.new
		@genre = Genre.new
		@artist = Artist.new
	end

	def create
		if Artist.where(artist_name: artist_params["artist_name"]).empty?
			@artist = Artist.new(artist_params)
		else
			@artist = Artist.find_by(artist_name: artist_params["artist_name"])
		end
		if Genre.where(genre_name: genre_params["genre_name"]).empty?
			@genre = Genre.new(genre_params)
		else
			@genre = Genre.find_by(genre_name: genre_params["genre_name"])
		end
		if Label.where(label_name: label_params["label_name"]).empty?
			@label = Label.new(label_params)
		else
			@label = Label.find_by(label_name: genre_params["label_name"])
		end
		@artist.save
		@genre.save
		@label.save
		@item=Item.new
		@item.id = 1
		@item.artist_id = @artist.id
		@item.save

		#session[:temp_artist_name] = @artist.artist_name#params[:artist]
		# binding.pry
		redirect_to edit_item_path(@item)
	end

	private

		def artist_params
			params.require(:artist).permit(:id, :artist_name)
		end

		def label_params
    		params.require(:label).permit(:id, :label_name)
  		end

  		def genre_params
  			params.require(:genre).permit(:genre_name)
  		end
  		# def item_params
    #  		params.require(:item).permit(
    #   		:item_name,:list_price,:cost_price,:sales_status,:genre_id,:artist_id,:label_id,:release_date,
    #   		:jacket_number,gacket_images:[],discs_attributes:[:id,:disc_name,:disc_number,
    #   		songs_attributes:[:id,:recording_number,:song_title,:play_time]])
    # 	end

end