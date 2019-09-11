class RenameTitreColumnToItems < ActiveRecord::Migration[5.2]
  def change
  	rename_column :items, :label_id, :artist_id
  end
end
