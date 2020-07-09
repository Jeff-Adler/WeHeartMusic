class CreateArtistGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :artist_genres do |t|
      t.integer :artist_id
      t.integer :genre_id
    end
  end
end
