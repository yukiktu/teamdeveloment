class AddColumnToDeliveryAdresses < ActiveRecord::Migration[5.2]
  def change
    add_column :delivery_adresses, :address, :text
  end
end
