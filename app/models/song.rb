class Song < ActiveRecord::Base
    has_many :user_songs
    has_many :users, through: :user_songs
end