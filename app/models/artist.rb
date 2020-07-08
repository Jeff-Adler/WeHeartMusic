class Artist < ActiveRecord::Base
    has_many :user_artists
    has_many :users, through: :user_artists

    # def save_if_new
    #     Artist.all.select do |a|
    #         if a.name == self.name
    #             puts "Artist already exists"
    #         else
    #             puts "New artist has been added!"
    #             Artist.create(name: self.name, popularity: self.popularity)
    #         end
    #     end
    # end


end

