class Artist < ActiveRecord::Base
    has_many :user_artists
    has_many :users, through: :user_artists

    def self.verify_artist(artist)
        check= self.all.find_by(name: artist.name)
        if check
            check
        else
        Artist.create(name: artist.name, popularity: artist.popularity)

        end
    end

end