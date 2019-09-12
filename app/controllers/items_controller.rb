class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.gacket_images.build
    @disc = @item.discs.build
    @song = @disc.songs.build
  end

  def create
   @item = Item.new(item_params)
　　@item.save
  end

  def about
  end

  private

  def item_params
     params.require(:item).permit(
      :item_name, :list_price, :cost_price, :sales_status, :release_date, :jacket_number, gacket_images:[],
      discs_attributes: [:id,:genre_id, :item_id, :disc_name, :disc_number, ],
      songs_attributes: [:id, :disc_id, :recording_number, :song_title, :play_time, ],
      )
  end

end

