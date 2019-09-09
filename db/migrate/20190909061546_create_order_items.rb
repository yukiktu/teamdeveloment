class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.string :item_name
      t.integer :item_count
      t.decimal :list_price
      t.decimal :tax_rate

      t.timestamps
    end
  end
end
