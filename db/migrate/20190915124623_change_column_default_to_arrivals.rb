class ChangeColumnDefaultToArrivals < ActiveRecord::Migration[5.2]
  def change
  	change_column_default(:arrivals, :arrival_status, 0)
  end
end
