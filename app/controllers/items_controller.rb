class ItemsController < ApplicationController

  def index
    @items = Item.all
    @gacket_images = GacketImage.all
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


  def new
    # @label = Label.new
    # @artist = Artist.new
    @item = Item.new
    @item.gacket_images.build
    @disc = @item.discs.build
    @song = @disc.songs.build
    # @disc = Disc.new
    # @song = Song.new
    # @genre = Genre.new
    # @gacket_image = GacketImage.new
  end

  def create #↓@gacket_imageは多分不要？paramsも
    #@label = Label.new(label_params)
    #@genre = Genre.new(genre_params)
    #@artist = Artist.new(artist_params)
    @item = Item.new(item_params)
    #@gacket_image = GacketImage.new(gacket_image_params)
    #@disc = Disc.new(disc_params)
    #@song = Song.new(song_params)
    #@song.disc = @disc
    #@disc.item = @item
    #@disc.genre = @genre
    #@disc.artist = @artist
    #@item.label = @label
    #@artist.label = @label

    #@label.save
    #@genre.save
    #@artist.save
    @item.save
    #@disc.save
    #@song.save
    #@artist.label = @label
    redirect_to items_path
  end

   def show
    @item = Item.find(params[:id])
    #@gacket_image = Gacket_image.find(params[:id])
    #@artist = Artist.find(params[:id])
    #@label = Label.find(params[:id])
    @disc = Disc.find(params[:id])
    @song = Song.find(params[:id])
   end
    #@gacket_image.item = @item



  private
    def item_params
     params.require(:item).permit(
      :item_name, :list_price, :cost_price, :sales_status, :release_date, :id, :image, :jacket_number, gacket_images_images:[],
      #gacket_images_attributes: [:id, :image, :jacket_number,
      discs_attributes: [:id, :disc_name, :disc_number,
      songs_attributes: [:id, :recording_number, :song_title, :play_time ]])
  end
 # def item_params
 #     params.require(:item).permit(
 #      :item_name, :list_price, :cost_price, :sales_status, :release_date, :jacket_number, gacket_images_images:[],
 #      disc_attributes: [:id,:genre_id, :item_id, :disc_name, :disc_number, ],
 #      song_attributes: [:id, :disc_id, :recording_number, :song_title, :play_time, ],
 #      )
 #  end
   #def label_params
   #params.require(:label).permit(:label_name)
  #end
  #def artist_params
    #params.require(:artist).permit(:artist_name)
  #end
  #def item_params
    #params.require(:item).permit(:artist_id, :item_name, :list_price, :cost_price, :sales_status, :release_date, :disc_id, :label_id, gacket_images_images: [])
  #end
#def genre_params
    #params.require(:genre).permit(:genre_name)
  #end
  #def disc_params
   # params.require(:disc).permit(:disc_name, :disc_number, :genre_id, :item_id, :genre_id, :artist_id)
  #end
  #def song_params
    #params.require(:song).permit(:record_number, :song_title, :play_time, :disc_id,)
  #end
  #def gacket_image_params
  # params.require(:gacket_image).require(:jacket_number)#, :image_id)
  #end

 end
