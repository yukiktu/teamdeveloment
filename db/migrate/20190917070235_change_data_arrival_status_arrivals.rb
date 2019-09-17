class ChangeDataArrivalStatusArrivals < ActiveRecord::Migration[5.2]
  def change
  	change_column :arrivals, :arrival_status, :string
  end
end
