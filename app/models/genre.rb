class Genre < ActiveRecord::Base
    has_many :artist_genres
    has_many :artists, through: :artist_genres
    validates_uniqueness_of :name


    def self.most_common
        most_c = self.all.map {|g| g.artist_genres.count}
        
        self.all.select do |g| 
            if g.artist_genres.count == most_c.max
            puts "The most popular genre(s) in the database are below!"
            puts g.name
            end
        end
    end


end