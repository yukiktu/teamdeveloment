class AddIndexToOrderItems < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :order_items, :artist_name, false
  end
end
