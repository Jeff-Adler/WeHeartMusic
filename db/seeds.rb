#This file serves purely to test classes and models as you build the program
User.destroy_all
Artist.destroy_all
UserArtist.destroy_all
Connection.destroy_all
Rejection.destroy_all

# require 'rspotify'
# #i had stored the RSpotify::authenticate inside spotify_setup.rb . if its somewhere else, then it can be taken out
# require_relative './config/.spotify_setup.rb'
# top_50_song = RSpotify::Playlist.find("spotifycharts", "37i9dQZEVXbLRQDuF5jeBp").tracks(limit:10).each {|i| Song.create(name: i.name)}
# top_50_artist = RSpotify::Playlist.find("spotifycharts", "37i9dQZEVXbLRQDuF5jeBp").tracks(limit:10).each {|i| User.create(name: i.artists[0].name)}

# counter = 0
# while counter < 10 do
#   UserSong.create(user:User.all[counter], song:Song.all[counter])
#   counter += 1
# end


# t.string :name
# t.integer :age
# t.string :city
# t.string :email
counter = 1
user_array = []
while counter < 6 do
  user_array << User.create(name: "u#{counter}", age: counter + 20, city: "u#{counter}-city", email: "u#{counter}@gmail.com")
  counter += 1
end


# t.string :name
# t.integer :popularity
counter = 1
while counter < 6 do
  Artist.create(name: "a#{counter}", popularity: counter + 80)
  counter += 1
end

# create_table :user_artists do |t|
#   t.integer :user_id
#   t.integer :artist_id
counter = 0
while counter < 5 do
  UserArtist.create(user: User.all[counter], artist: Artist.all[counter])
  counter += 1
end

# create_table :connections do |t|
#   t.integer :connector_id, foreign_key: { to_table: 'users' }
#   t.integer :connectee_id, foreign_key: { to_table: 'users' }
#   t.float :strength
# end

counter = 0
while counter < 4 do
  Connection.create(connector: User.all[counter], connectee: User.all[counter + 1], strength: counter / 4.0)
  counter +=  1
end


# create_table :rejections do |t|
#   t.integer :rejector_id, foreign_key: { to_table: 'users' }
#   t.integer :rejectee_id, foreign_key: { to_table: 'users' }
#   t.float :strength
# end

counter = 0
while counter < 4 do
  Rejection.create(rejector: User.all[counter], rejectee: User.all[counter + 1], strength: counter / 4.0)
  counter +=  1
end

u1 = User.all[0]
u2 = User.all[1]
u3 = User.all[2]
u4 = User.all[3]
u5 = User.all[4]

a1 = Artist.all[0]
a2 = Artist.all[1]
a3 = Artist.all[2]
a4 = Artist.all[3]
a5 = Artist.all[4]

ua1 = UserArtist.all[0]
ua2 = UserArtist.all[1]
ua3 = UserArtist.all[2]
ua4 = UserArtist.all[3]
ua5 = UserArtist.all[4]

ua6 = UserArtist.create(user: u1, artist: a2)
ua7 = UserArtist.create(user: u1, artist: a3)
ua6 = UserArtist.create(user: u1, artist: a4)
ua6 = UserArtist.create(user: u2, artist: a1)

Connection.create(connector: u1, connectee:u3)
Connection.create(connector: u1, connectee:u4)
Connection.create(connector: u1, connectee:u5)
Connection.create(connector: u2, connectee:u1)

Rejection.create(rejector: u1, rejectee:u3)
Rejection.create(rejector: u1, rejectee:u4)
Rejection.create(rejector: u1, rejectee:u5)
Rejection.create(rejector: u2, rejectee:u1)

u1 = User.all[0]
u2 = User.all[1]
Connection.match?(u1,u2)
Connection.match?(u2,u1)


u3 = User.all[2]
u4 = User.all[3]
Connection.match?(u2,u3)