class ItemsController < ApplicationController
  def new
    @item = Item.new

  end

  def create
    @item = Item.new
　　@item.save


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

  def edit
    @item = Item.find(params[:id])

    end
  end


  def update
    item = Item.find(params[:id])
    if item.update
      redirect_to item_path(params[:id])
    end
  end

  def search
    @items = Item.search(params[:search])
  end


  private

  def item_params
     params.require(:item).permit
     ( disc_attributes: [:genre_id,:item_id,:disc_name,:disc_number,:id], 
       song_attributes: [:id, :disc_id, :recording_number, :song_title,:play_time],
                                   )
  end

end
