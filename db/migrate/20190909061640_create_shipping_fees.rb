class CreateShippingFees < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_fees do |t|
      t.integer :shipping_fee

      t.timestamps
    end
  end
end
