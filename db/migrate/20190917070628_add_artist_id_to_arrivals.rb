class AddArtistIdToArrivals < ActiveRecord::Migration[5.2]
  def change
    add_column :arrivals, :artist_id, :integer
  end
end
