class CreateUserArtists < ActiveRecord::Migration[6.0]
    def change
        create_table :user_artists do |t|
            t.integer :user_id
            t.integer :artist_id
        end
    end
end