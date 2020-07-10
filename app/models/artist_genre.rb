class ArtistGenre < ActiveRecord::Base
    belongs_to :artist
    belongs_to :genre

    def self.verify_artistgenre(artist,genres)
        genres.each do |genre|
            if ArtistGenre.all.any?{|agconnection| agconnection.artist == artist && agconnection.genre == genre}

            else
                ArtistGenre.create(artist:artist,genre:genre)
            end
        end
    end
end
