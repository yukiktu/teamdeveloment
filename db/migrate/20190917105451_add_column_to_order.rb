class AddColumnToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :new_addressee, :string
  end
end
