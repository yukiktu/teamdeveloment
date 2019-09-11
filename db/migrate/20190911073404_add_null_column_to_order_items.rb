class AddNullColumnToOrderItems < ActiveRecord::Migration[5.2]
  def change
  	 change_column_null :order_items, :item_count, false
  	change_column_null :order_items, :list_price, false
  	change_column_null :order_items, :tax_rate, false
  end
end
