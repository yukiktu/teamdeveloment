class RemoveGenreIdFromDiscs < ActiveRecord::Migration[5.2]
  def change
    remove_column :discs, :genre_id, :integer
  end
end
