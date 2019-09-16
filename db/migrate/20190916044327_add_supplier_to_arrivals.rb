class AddSupplierToArrivals < ActiveRecord::Migration[5.2]
  def change
    add_column :arrivals, :supplier, :string
  end
end
