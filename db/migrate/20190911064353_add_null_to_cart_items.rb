class AddNullToCartItems < ActiveRecord::Migration[5.2]
  def change
  	change_column_default(:cart_items, :item_count, 1)
  end
end
