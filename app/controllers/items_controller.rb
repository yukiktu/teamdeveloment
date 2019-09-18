class ItemsController < ApplicationController
#before_action :authenticate_admin_user!, only: [:edit, :update]

  def index
    @items = Item.all#where(label_id: 42)
    @items = Item.page(params[:page]).per(12).order(:id)
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
      #@arrivals = Arrival.where(item_id: @items)
    #else
      #@arrivals = Arrival.new
      #@arrivals.arrival_count = '0'
      #@arrivals.arrival_expected_date = ""
    #end
  end

  def search
    @items = Item.where(item_name: params[:search])
    # if @item.search_method
      # @items = @item.search_method
    @label = Label.find_by(@label)#@label_id)
    # end
    @genre = Genre.find_by(@item)
    @artist = Artist.find_by(@artist)
      render :index
    # end
  end


  def show
    @item = Item.find(params[:id])
    @gacket_image = GacketImage.find_by(item_id: @item.id)

    # @genre = Genre.find_by(item_id: @item.id)
    #@gacket_image = Image.find(item_id: @item.id)
    # @artist = Artist.find(params[:id])
    # @label = Label.find(params[:id])
    # @disc = Disc.find(params[:id])
    # @song = Song.find(params[:id])
  end
    #@gacket_image.item = @item


  def edit
    #artist_name = session[:temp_artist_name]
    #@artist = Artist.find_by(artist_name: artist_name)
    #binding.pry
    #@label = Label.new
    #@label = @label.items.build
    #@artist = Artist.new
    @item = Item.find(params[:id])
    @item.gacket_images.build
    @disc = @item.discs.build
    @song = @disc.songs.build
    @label = Label.find_by(id: @item.label_id)
    @genre = Genre.find_by(id: @item.artist_id)
    @artist = Artist.find_by(id: @item.genre_id)

    # @disc = Disc.new
    # @song = Song.new
    # @genre = Genre.new
    # @gacket_image = GacketImage.new
  end


  def update

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

    @item = Item.find(params[:id])
    @item.artist_id = @artist.id
    @item.genre_id = @genre.id
    @item.label_id = @label.id

    @item.update(item_params)

    redirect_to items_path
  end

private
    def item_params
     params.require(:item).permit(
      :item_name,:list_price,:cost_price,:sales_status,:genre_id,:artist_id,:label_id,:release_date,
      :jacket_number,gacket_images_images:[],discs_attributes:[:id,:disc_name,:disc_number,
      songs_attributes:[:id,:recording_number,:song_title,:play_time]])
    end

    def artist_params
      params.require(:artist).permit(:artist_name)
    end

    def label_params
        params.require(:label).permit(:label_name)
    end

    def genre_params
        params.require(:genre).permit(:genre_name)
    end

 end

 # def item_params
 #     params.require(:item).permit(
 #      :item_name, :list_price, :cost_price, :sales_status, :release_date, :jacket_number, gacket_images:[],
 #      disc_attributes: [:id,:genre_id, :item_id, :disc_name, :disc_number, ],
 #      song_attributes: [:id, :disc_id, :recording_number, :song_title, :play_time, ],
 #      )
 #  end
  # def label_params
  #   params.require(:label).permit(:id, :label_name)
  # end
  # def artist_params
  #   params.require(:artist).permit(:id, :artist_name)
  # end
  #def item_params
    #params.require(:item).permit(:artist_id, :item_name, :list_price, :cost_price, :sales_status, :release_date, :disc_id, :label_id, gacket_images_images: [])
  #end
#def genre_params
    #params.require(:genre).permit(:genre_name)
  #end
  #def disc_params
    #params.require(:disc).permit(:disc_name, :disc_number, :artist_id)
  #end
  #def song_params
    #params.require(:song).permit(:record_number, :song_title, :play_time, :disc_id,)
  #end
  #def gacket_image_params
  # params.require(:gacket_image).require(:jacket_number)#, :image_id)
  #end
