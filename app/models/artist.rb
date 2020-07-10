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
        most_p = self.all.select do |a| 
            a.users.count == most_p.max
        end
        puts "The most popular artist(s) are currently #{most_p.map{|a| a.name}.join(", ")} with a whopping #{most_p.map{|a| a.users.count}.uniq[0]} fans!"
    end

    def self.most_obscure
        least_pop = self.all.map {|a| a.popularity}
        
        most_o = self.all.select do |a|
            a.popularity == least_pop.max
        end
        puts "The most obscure artist(s) within our database are currently #{most_o.map{|a| a.name}.join(", ")}, ranked #{most_o.map{|a| a.popularity}.uniq[0]} in popularity on Spotify."
    end

end

