class AddArtistIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :artist_id, :integer
  end
end
