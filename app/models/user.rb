class User < ActiveRecord::Base
    has_many :connections
    #has_many :users, through: :connections
    has_many :user_songs
    has_many :songs, through: :user_songs
end

#Connections will return a PAIR of users