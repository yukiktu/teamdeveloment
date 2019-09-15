class AddNullToDeliveryAdresses < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :delivery_adresses, :end_user_id, false
  	change_column_null :delivery_adresses, :addressee, false
  	change_column_null :delivery_adresses, :postal_code, false
  	change_column_null :delivery_adresses, :address, false
  	change_column_null :delivery_adresses, :phone_number, false
  	change_column_null :delivery_adresses, :created_at, false
  	# change_column_null :delivery_adresses, :update_at, false
  end
end
