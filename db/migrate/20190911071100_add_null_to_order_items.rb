class AddNullToOrderItems < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :order_items, :order_id, false
  	change_column_null :order_items, :item_name, false

  	# change_column_null :order_items, :created_at, false
  	# change_column_null :order_items, :update_at, false
  end
end
