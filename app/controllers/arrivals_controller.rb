class ArrivalsController < ApplicationController

  def index
  	@arrival_new = Arrival.new
  	@arrivals = Arrival.all
    @categories = Item.all
  end

  def create
  	@arrival_new = Arrival.new(arrival_params)
  	@arrival_new.save
  	redirect_to arrivals_path
  end

  def edit
  end

  def arrival_params
  	params.require(:arrival).permit(:item_id, :arrival_count, :purchase_order_date, :arrival_expected_date)
  end

end