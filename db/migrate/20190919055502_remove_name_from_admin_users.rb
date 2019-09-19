class RemoveNameFromAdminUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :admin_users, :name, :string
  end
end
