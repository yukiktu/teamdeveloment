class AddDefaultToEndUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column_default(:end_users, :enrollment_status, 1)
  end
end
