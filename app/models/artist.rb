class Artist < ActiveRecord::Base
    has_many :user_artists
    has_many :users, through: :user_artists
    has_many :artist_genres
    has_many :genres, through: :artist_genres
    #validates_uniqueness_of :name

    def self.verify_artist(artist)
        check= self.all.find_by(name: artist.name)
        if check
            check
        else
            Artist.create(name: artist.name, popularity: artist.popularity)
        end
    end

    def self.most_popular
        most_p = self.all.map {|a| a.users.count}
        #binding.pry
        self.all.select do |a| 
            if a.users.count == most_p.max
            puts "The most popular artist is currently #{a.name} with a whopping #{a.users.count} fans!"
            end
        end
    end

    def self.most_obscure
        least_pop = self.all.map {|a| a.popularity}
        
        self.all.select do |a|
            if a.popularity == least_pop.max
                puts "The most obscure artist within our database is currently #{a.name}, ranked #{a.popularity} in popularity on Spotify."
            end
        end
    end

end

