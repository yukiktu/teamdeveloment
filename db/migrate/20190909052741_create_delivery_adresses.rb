class CreateDeliveryAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_adresses do |t|
      t.integer :end_user_id
      t.string :addressee
      t.text :postal_code
      t.string :phone_number

      t.timestamps
    end
  end
end
