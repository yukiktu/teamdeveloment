class ItemsController < ApplicationController


  def index
    @items = Item.all
 end

  def new
    @item = Item.new
            @item.item_disces.build

  end

  def create
   @item = Item.new
　　@item.save
   redirect_to items_path
  end


private

  def item_params
     params.require(:item).permit(
      :item_name, :list_price, :cost_price,
      discs_attributes: [:genre_id, :item_id, :disc_name, :disc_number, :id, :artist_id],
      songs_attributes: [:id, :disc_id, :recording_number, :song_title, :play_time, ],
      gacket_images_attributes: [:id, :item_id, :gacket_number, :image_id]
      )
  end

end