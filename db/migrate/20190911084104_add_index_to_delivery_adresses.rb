class AddIndexToDeliveryAdresses < ActiveRecord::Migration[5.2]
  def change
  	add_index :delivery_adresses, :addressee
  	add_index :delivery_adresses, :address
  	add_index :delivery_adresses, :phone_number
  end
end
