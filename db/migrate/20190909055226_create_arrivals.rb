class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
      t.integer :item_id
      t.integer :arrival_count
      t.date :purchase_order_date
      t.date :arrival_expected_date
      t.integer :arrival_status

      t.timestamps
    end
  end
end
