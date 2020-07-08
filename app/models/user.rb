class User < ActiveRecord::Base
    has_many :connections, foreign_key: "connector_id"
    has_many :connectees, through: :connections
    has_many :rejections, foreign_key: "rejector_id"
    has_many :rejectees, through: :rejections
    has_many :user_artists
    has_many :artists, through: :user_artists

    def matches
        self.connectees.select do |element|
            Connection.match?(self,element)
        end
    end

    def connection_calculator(user_2)
        #this should be a user method. this takes the array from the user.artist method and feeds it here
       score=0

        artist_matches = self.artists.select do |self_artist|
            user2_artists.any? do |user2_artist|
                self_artist == user2_artist
            end
        end

        if !(artist_matches == nil)
            artist_matches.each do |artist|
                score += (3 * (100 - artist.popularity)/100)
            end
        else

            self_genres = []
            self.artist.each do |artist|
                artist.genres.each do |genre|
                    self_genres << genre
                end
            end

            user_2_genres = []
            user_2.artist.each do |artist|
                artist.genres.each do |genre|
                    user_2_genres << genre
                end
            end

            score += 1 - ((self_genres - user_2_genres).size / self_genres.size)
        end
        score
    end
end

