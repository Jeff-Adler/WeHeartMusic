class UserArtist < ActiveRecord::Base
    belongs_to :user
    belongs_to :artist

<<<<<<< HEAD

    def self.verify_top10_add(user,artist)
        if self.all.find_by(user_id: user.id,artist_id: artist.id)
         true
        end
     end
     def self.top10_filled?(user)
         UserArtist.where(user_id: user.id).count >= 10
     end
 
 
     def self.verified_create(user,artist)
 
         if !self.verify_top10_add(user,artist) && !self.top10_filled?(user)
          UserArtist.create(user: user, artist: artist)
         end
     end
 
=======
    def self.verify_top10_add(user,artist)
       if self.all.find_by(user_id: user.id,artist_id: artist.id)
        true
       end
    end
    def self.top10_filled?(user)
        UserArtist.where(user_id: user.id).count >10
    end


    def self.verified_create(user,artist)

        if !self.verify_top10_add(user,artist) && !self.top10_filled?(user)
         UserArtist.create(user: user, artist: artist)
        end
    end



>>>>>>> f44be06c12054fe2ce2f9c07e2f68b5c94e47560
end