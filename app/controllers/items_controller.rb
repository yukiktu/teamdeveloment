class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item.item_disces.build

  end


  def create
   @item = Item.new(item_params)
   if @item.save

   redirect_to items_path

  else
   render:new
  end
end


  def index
    @items = Item.all
    @gacket_image = Jacket_image.find(params[:id])
    @artist = Artist.find(params[:id])

  end

   def show
    @item = Item.find(params[:id])
    @gacket_image = Gacket_image.find(params[:id])
    @artist = Artist.find(params[:id])
    @label = Label.find(params[:id])
    @disc = Disc.find(params[:id])
  end


private

  def item_params
     params.require(:item).permit(
      :item_name, :list_price, :cost_price,
      discs_attributes: [:genre_id, :item_id, :disc_name, :disc_number, :id, :artist_id, :artist_name],
      songs_attributes: [:id, :disc_id, :recording_number, :song_title, :play_time, ],
      gacket_images_attributes: [:id, :item_id, :gacket_number, :image_id]
      )
  end

end
