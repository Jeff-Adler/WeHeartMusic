class UserArtists < ActiveRecord::Base
    belongs_to :user
    belongs_to :artist
end