class AddColumnToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :artist_name, :string
  end
end
