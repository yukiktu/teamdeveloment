class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :disc_id
      t.integer :recording_number
      t.string :song_title
      t.string :play_time

      t.timestamps
    end
  end
end
