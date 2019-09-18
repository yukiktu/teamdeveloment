class ArrivalsController < ApplicationController

# before_action :authenticate_admin_user!

def index
    @arrival = Arrival.new
    @arrivals = Arrival.all
    @artists = Artist.all
    @categories = Item.where(artist_id: @artists)
  end

  def create
    @arrival = Arrival.new(arrival_params)
    @arrival.save
    redirect_to arrivals_path
  end

  def edit
    @arrival = Arrival.find(params[:id])
    @artists = Artist.all
    @categories = Item.where(artist_id: @artists)
  end

  def update
    arrival = Arrival.find(params[:id])
    arrival.update(arrival_params)
    redirect_to arrivals_path
  end

  def destroy
    arrival = Arrival.find(params[:id])
    arrival.destroy
    redirect_to arrivals_path
  end

  def arrival_params
    params.require(:arrival).permit(:id, :item_id, :artist_id, :arrival_count, :purchase_order_date, :arrival_expected_date, :supplier, :arrival_status)
  end

end

