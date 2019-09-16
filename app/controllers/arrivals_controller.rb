class ArrivalsController < ApplicationController
# before_action :authenticate_admin_user!
  def index
  	@arrival = Arrival.new
  	@arrivals = Arrival.all
    @categories = Item.all
    @artists = Artist.all
    @artist = Artist.find_by(id: @artist_id)
    #binding.pry
    #@item = Item.find_by(id: @arrivals.item_id)
  end

  def create
  	@arrival = Arrival.new(arrival_params)
    #@arrival.artist_id = Artist.find_by(id: @artists.id)
  	@arrival.save
  	redirect_to arrivals_path
  end

  def edit
    @arrival = Arrival.find(params[:id])
    @categories = Item.all
  end

  def update
    arrival = Arrival.find(params[:id])
    arrival.update(arrival_params)
    redirect_to arrivals_path
  end

  def arrival_params
  	params.require(:arrival).permit(:id, :item_id, :artist_id, :arrival_count, :purchase_order_date, :arrival_expected_date, :supplier)
  end

end