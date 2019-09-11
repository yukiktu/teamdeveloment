class LabelsController < ApplicationController
	def index
		@label = Label.all
		@song_title
	end


	def new
		@label = Label.new
		@artist = Artist.new
		@artist.label = @label
		@item = Item.new
		@item.artist = @artist
		@disc = Disc.new
		@disc.item = @item
		@song = Song.new
		@song.disc = @disc
		@genre = Genre.new
		@disc.genre = @genre
		@gacket_image = GacketImage.new
		@gacket_image.item = @item

	end

	def create
		@label = Label.new(label_params)
		@genre = Genre.new(genre_params)
		@artist = Artist.new(artist_params)
		@items = Item.new(item_params)
		#@gacket_image = GacketImage.new(gacket_image_params)
		@disc = Disc.new(disc_params)
		@song = Song.new(song_params)

		if @label.save && @song.save
			@genre.save
			@artist.save
			@items.save
			#@gacket_image.save
			@disc.save
			redirect_to labels_path
		else
			render 'new'
		end
	end

	private
	def label_params
		params.require(:label).permit(:label_name)
	end
	def artist_params
		params.require(:artist).permit(:artist_name, :label_id)
	end
	def item_params
		params.require(:item).permit(:item_name, :list_price, :cost_price, :sales_status, :release_date,  gacket_images_images: [])
	end
	def genre_params
		params.require(:genre).permit(:genre_name)
	end
	def disc_params
		params.require(:disc).permit(:disc_name, :dis_number, :genre_id, :item_id)
	end
	def song_params
		params.require(:song).permit(:record_number, :song_title, :play_time, :disc_id,)
	end
	#def gacket_image_params
	#	params.require(:gacket_image).require(:jacket_number)#, :image_id)
	#end

end

