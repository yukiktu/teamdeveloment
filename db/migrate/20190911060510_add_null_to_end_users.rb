class AddNullToEndUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :end_users, :last_name, false
  	change_column_null :end_users, :first_name, false
  	change_column_null :end_users, :kana_last_name, false
  	change_column_null :end_users, :kana_first_name, false
  	change_column_null :end_users, :postal_code, false
  	change_column_null :end_users, :address, false
  	change_column_null :end_users, :phone_number, false
  	# change_column_null :end_users, :mail_address, false
  	# change_column_null :end_users, :password, false
  	change_column_null :end_users, :enrollment_status, false
  	# change_column_null :end_users, :update_at, false
  	# change_column_null :end_users, :created_at, false
  end
end
