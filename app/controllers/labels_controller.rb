class LabelsController < ApplicationController
#before_action :authenticate_admin_user!

	def new
		@label = Label.new
		@genre = Genre.new
		@artist = Artist.new
		@item = Item.new
	end

	def create

		if Artist.where(artist_name: artist_params["artist_name"]).empty?
			if artist_params["artist_name"] == ""
				@artist = Artist.new
			else
				@artist = Artist.new(artist_params)
				@artist.save
			end
		else
			@artist = Artist.find_by(artist_name: artist_params["artist_name"])
		end

		if Genre.where(genre_name: genre_params["genre_name"]).empty?
			if genre_params["genre_name"] == ""
				@genre = Genre.new
			else
				@genre = Genre.new(genre_params)
				@genre.save
			end
			@genre = Genre.new(genre_params)
			@genre.save
		else
			@genre = Genre.find_by(genre_name: genre_params["genre_name"])
		end

		if Label.where(label_name: label_params["label_name"]).empty?
			if label_params["label_name"] == ""
				@labele = Label.new
			else
				@label = Label.new(label_params)
				@label.save
			end
			@label = Label.new(label_params)
			@label.save
		else
			@label = Label.find_by(label_name: label_params["label_name"])
			# render :new
		end


		if @item.item_name == ""
			@item = Item.new
			render :new
		else
					 # binding.pry
		@item = Item.new(item_params)
		# @item.id = 1
		 @item.artist_id = @artist.id
		 @item.genre_id = @genre.id
		 @item.label_id = @label.id
		redirect_to edit_item_path(@item)
		end
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