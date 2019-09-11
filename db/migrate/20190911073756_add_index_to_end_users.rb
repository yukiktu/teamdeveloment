class AddIndexToEndUsers < ActiveRecord::Migration[5.2]
  def change
  	add_index :end_users, :last_name
  	add_index :end_users, :first_name
  	add_index :end_users, :kana_last_name
  	add_index :end_users, :kana_first_name
  	add_index :end_users, :address
  	add_index :end_users, :phone_number
  end
end
