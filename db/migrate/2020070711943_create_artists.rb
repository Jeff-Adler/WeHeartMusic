class CreateArtists < ActiveRecord::Migration[6.0]
    def change
        create_table :artists do |t|
            t.string :name
            t.integer :popularity
            t.string :genres
        end
    end
end