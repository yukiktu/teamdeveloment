class ItemsController < ApplicationController

  def index
    @items = Item.all
    #@artists = Artist.find(id: @items.artist)
    #↑初期に作ったテーブルがnullなのでそれを削除すると使えます
    arrival = Arrival.where(item_id: @items)
    if arrival.present?
      @arrivals = Arrival.where(item_id: @items)
    else
      @arrivals = Arrival.new
      @arrivals.arrival_count = '0'
      @arrivals.arrival_expected_date = ""
    end
  end


  def new
    # @label = Label.new
    # @artist = Artist.new
    @item = Item.new
    @item.discs.build
    @item.discs[0].songs.build
    # @disc = Disc.new
    # @song = Song.new
    # @genre = Genre.new
    # @gacket_image = GacketImage.new
  end

  def create #↓@gacket_imageは多分不要？paramsも
    @label = Label.new(label_params)
    @genre = Genre.new(genre_params)
    @artist = Artist.new(artist_params)
    @item = Item.new(item_params)
    #@gacket_image = GacketImage.new(gacket_image_params)
    @disc = Disc.new(disc_params)
    @song = Song.new(song_params)

    @song.disc = @disc
    @disc.item = @item
    @disc.genre = @genre
    @disc.artist = @artist
    @item.label = @label
    @artist.label = @label
  end

    #@gacket_image.item = @item



  private

  def label_params
    params.require(:label).permit(:label_name)
  end
  def artist_params
    params.require(:artist).permit(:artist_name)
  end
  def item_params
    params.require(:item).permit(:artist_id, :item_name, :list_price, :cost_price, :sales_status, :release_date, :label_id, gacket_images_images: [])
  end
  def genre_params
    params.require(:genre).permit(:genre_name)
  end
  def disc_params
    params.require(:disc).permit(:disc_name, :dis_number, :genre_id, :item_id, :genre_id, :artist_id)
  end
  def song_params
    params.require(:song).permit(:record_number, :song_title, :play_time, :disc_id,)
  end
  #def gacket_image_params
  # params.require(:gacket_image).require(:jacket_number)#, :image_id)
  #end

 end
