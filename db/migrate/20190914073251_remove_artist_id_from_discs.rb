class RemoveArtistIdFromDiscs < ActiveRecord::Migration[5.2]
  def change
    remove_column :discs, :artist_id, :integer
  end
end
