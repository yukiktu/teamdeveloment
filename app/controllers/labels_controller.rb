class LabelsController < ApplicationController
before_action :authenticate_admin!



	def index
		@label = Label.new
		@genre = Genre.new
		@artist = Artist.new
		@item = Item.new
		@item_new = Item.new #エラーメッセージ表示用のインスタンス変数
	end

	def create
		@label = Label.new
		@genre = Genre.new
		@artist = Artist.new
		@item = Item.new
		if Artist.where(artist_name: artist_params["artist_name"]).empty?
			if artist_params["artist_name"].blank?
				render :new and return
			else
				@artist = Artist.new(artist_params)
				@artist.save
			end
		else
			@artist = Artist.find_by(artist_name: artist_params["artist_name"])
		end

		if Genre.where(genre_name: genre_params["genre_name"]).empty?
			if genre_params["genre_name"].blank?
				render :new and return
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
			if label_params["label_name"].blank?
				render :new and return
			else
				@label = Label.new(label_params)
				@label.save
			end
			@label = Label.new(label_params)
			@label.save
		else
			@label = Label.find_by(label_name: label_params["label_name"])
		end

		@item_new = Item.new(item_params)

		if @item_new.item_name.blank?
			render :new and return

		elsif Item.find_by(artist_id: @artist.id, item_name: @item_new.item_name).present?
		 	render :index and return
		else

			@item_new.artist_id = @artist.id
		 	@item_new.genre_id = @genre.id
		 	@item_new.label_id = @label.id
		 	if @item_new.save
				redirect_to edit_item_path(@item_new)
		 	else
		 		render :index
			end
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


end