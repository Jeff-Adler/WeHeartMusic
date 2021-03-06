class Genre < ActiveRecord::Base
    has_many :artist_genres
    has_many :artists, through: :artist_genres


    def self.most_common
        most_c = self.all.map {|g| g.artist_genres.count}
        puts "The most popular genre(s) in the database are below!"
        self.all.select do |g| 
            if g.artist_genres.count == most_c.max
            puts g.name
            end
        end
    end

    def self.verify_genre(spotify_artist)

        spotify_artist.genres.map do |genre_element|

            check= self.find_by(name: genre_element)
            if check
                check
            else
                Genre.create(name: genre_element)
            end              
        end
    end

end