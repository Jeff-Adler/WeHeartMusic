#This file serves purely to test classes and models as you build the program
User.destroy_all
Artist.destroy_all
UserArtist.destroy_all
Connection.destroy_all
Rejection.destroy_all
Genre.destroy_all
ArtistGenre.destroy_all

#artist seeds
artist1 = Artist.create(name: "The Beatles", popularity: 30)
artist2 = Artist.create(name: "Beyonce", popularity: 20)
artist3 = Artist.create(name: "Vampire Weekend", popularity: 80)
artist4 = Artist.create(name: "Drake", popularity: 70)
artist5 = Artist.create(name: "Father John Misty", popularity: 150)
artist6 = Artist.create(name: "Lizzo", popularity: 50)
artist7 = Artist.create(name: "Arctic Monkeys", popularity: 75)
artist8 = Artist.create(name: "Tame Impala", popularity: 90)
artist9 = Artist.create(name: "Rihanna", popularity: 45)
artist10 = Artist.create(name: "The Strokes", popularity: 125)
artist11 = Artist.create(name: "Bon Iver", popularity: 140)
artist12 = Artist.create(name: "Courtney Barnett", popularity: 180)
artist13 = Artist.create(name: "Kanye West", popularity: 25)
artist14 = Artist.create(name: "Phoebe Bridgers", popularity: 250)
artist15 = Artist.create(name: "The Grateful Dead", popularity: 200)
artist16 = Artist.create(name:"Nirvana",popularity: 80)
artist17 = Artist.create(name: "Disturbed",popularity: 20)
artist18 = Artist.create(name:"Ice Cube",popularity: 60)


#user seeds
user1 = User.create(name: "Eli", city: "Brooklyn", age: 28, email: "eliemail")
user2 = User.create(name: "Jeff", city: "Brooklyn", age: 30, email: "jeffemail")
user3 = User.create(name: "Luis", city: "NYC", age: 28, email: "luisemail")
user4 = User.create(name: "Chiara", city: "Brooklyn", age: 27, email: "ccemail")
user5 = User.create(name: "Tashawn", city: "LA", age: 32, email: "temail")
user6 = User.create(name: "Caryn", city: "NYC", age: 30, email: "caemail")
user7 = User.create(name: "Lisa", age: 20, city: "Brick City", email: "u1@gmail.com")
user8 = User.create(name: "Bill", age: 20, city: "Mars", email: "u2@gmail.com")


#userartists seeds
userartist1 = UserArtist.create(user: user1, artist: artist5)
userartist2 = UserArtist.create(user: user1, artist: artist15)
userartist3 = UserArtist.create(user: user1, artist: artist8)
userartist4 = UserArtist.create(user: user1, artist: artist13)
userartist5 = UserArtist.create(user: user2, artist: artist1)
userartist6 = UserArtist.create(user: user2, artist: artist2)
userartist7 = UserArtist.create(user: user2, artist: artist3)
userartist8 = UserArtist.create(user: user2, artist: artist5)
userartist9 = UserArtist.create(user: user3, artist: artist15)
userartist10 = UserArtist.create(user: user3, artist: artist3)
userartist11 = UserArtist.create(user: user3, artist: artist10)
userartist12 = UserArtist.create(user: user3, artist: artist14)
userartist13 = UserArtist.create(user: user4, artist: artist9)
userartist14 = UserArtist.create(user: user4, artist: artist8)
userartist15 = UserArtist.create(user: user4, artist: artist1)
userartist16 = UserArtist.create(user: user4, artist: artist7)
userartist17 = UserArtist.create(user: user5, artist: artist4)
userartist18 = UserArtist.create(user: user5, artist: artist5)
userartist19 = UserArtist.create(user: user5, artist: artist11)
userartist20 = UserArtist.create(user: user5, artist: artist12)
userartist21 = UserArtist.create(user: user6, artist: artist6)
userartist22 = UserArtist.create(user: user6, artist: artist3)
userartist23 = UserArtist.create(user: user6, artist: artist13)
userartist24 = UserArtist.create(user: user6, artist: artist14)
userartist24 = UserArtist.create(user: user7,artist: artist1)
userartist25 = UserArtist.create(user: user8,artist: artist2)
userartist26 = UserArtist.create(user: user8,artist: artist3)


#genre seeds
genre1 = Genre.create(name: "Rock")
genre2 = Genre.create(name: "Rap")
genre3 = Genre.create(name: "R&B")
genre4 = Genre.create(name: "Country")
genre5 = Genre.create(name: "Pop")
genre6 = Genre.create(name: "Singer/Songwriter")
genre7 = Genre.create(name: "Indie")
genre8 = Genre.create(name: "Indie Rock")
genre9 = Genre.create(name: "Garage Rock")
genre10 = Genre.create(name: "Jam")
genre11 = Genre.create(name: "Psychedlic Rock")

#artistgenre seeds
artistgenre1 = ArtistGenre.create(artist: artist1, genre: genre1)
artistgenre2 = ArtistGenre.create(artist: artist1, genre: genre11)
artistgenre3 = ArtistGenre.create(artist: artist2, genre: genre3)
artistgenre4 = ArtistGenre.create(artist: artist2, genre: genre5)
artistgenre5 = ArtistGenre.create(artist: artist3, genre: genre1)
artistgenre6 = ArtistGenre.create(artist: artist3, genre: genre7)
artistgenre7 = ArtistGenre.create(artist: artist3, genre: genre8)
artistgenre8 = ArtistGenre.create(artist: artist4, genre: genre2)
artistgenre9 = ArtistGenre.create(artist: artist4, genre: genre3)
artistgenre10 = ArtistGenre.create(artist: artist4, genre: genre5)
artistgenre11 = ArtistGenre.create(artist: artist5, genre: genre1)
artistgenre12 = ArtistGenre.create(artist: artist5, genre: genre4)
artistgenre13 = ArtistGenre.create(artist: artist5, genre: genre6)
artistgenre14 = ArtistGenre.create(artist: artist6, genre: genre2)
artistgenre15 = ArtistGenre.create(artist: artist6, genre: genre3)
artistgenre16 = ArtistGenre.create(artist: artist6, genre: genre4)
artistgenre17 = ArtistGenre.create(artist: artist7, genre: genre1)
artistgenre18 = ArtistGenre.create(artist: artist7, genre: genre7)
artistgenre19 = ArtistGenre.create(artist: artist7, genre: genre8)
artistgenre20 = ArtistGenre.create(artist: artist7, genre: genre9)
artistgenre21 = ArtistGenre.create(artist: artist8, genre: genre1)
artistgenre22 = ArtistGenre.create(artist: artist8, genre: genre8)
artistgenre23 = ArtistGenre.create(artist: artist8, genre: genre9)
artistgenre24 = ArtistGenre.create(artist: artist8, genre: genre11)
artistgenre25 = ArtistGenre.create(artist: artist9, genre: genre3)
artistgenre26 = ArtistGenre.create(artist: artist9, genre: genre5)
artistgenre27 = ArtistGenre.create(artist: artist10, genre: genre1)
artistgenre28 = ArtistGenre.create(artist: artist10, genre: genre7)
artistgenre29 = ArtistGenre.create(artist: artist10, genre: genre8)
artistgenre30 = ArtistGenre.create(artist: artist10, genre: genre9)
artistgenre31 = ArtistGenre.create(artist: artist11, genre: genre4)
artistgenre32 = ArtistGenre.create(artist: artist11, genre: genre6)
artistgenre33 = ArtistGenre.create(artist: artist11, genre: genre11)
artistgenre34 = ArtistGenre.create(artist: artist12, genre: genre1)
artistgenre35 = ArtistGenre.create(artist: artist12, genre: genre6)
artistgenre36 = ArtistGenre.create(artist: artist12, genre: genre9)
artistgenre37 = ArtistGenre.create(artist: artist13, genre: genre2)
artistgenre38 = ArtistGenre.create(artist: artist13, genre: genre3)
artistgenre39 = ArtistGenre.create(artist: artist13, genre: genre5)
artistgenre40 = ArtistGenre.create(artist: artist14, genre: genre4)
artistgenre41 = ArtistGenre.create(artist: artist14, genre: genre6)
artistgenre42 = ArtistGenre.create(artist: artist14, genre: genre7)
artistgenre43 = ArtistGenre.create(artist: artist15, genre: genre1)
artistgenre44 = ArtistGenre.create(artist: artist15, genre: genre10)
artistgenre45 = ArtistGenre.create(artist: artist15, genre: genre11)


#connections
connection1 = Connection.create(connector: user1 , connectee: user2, strength: 7.5)
connection2 = Connection.create(connector: user1 , connectee: user4, strength: 6.3)
connection3 = Connection.create(connector: user2 , connectee: user6, strength: 9.2)
connection4 = Connection.create(connector: user3 , connectee: user1, strength: 7.3)
connection5 = Connection.create(connector: user4 , connectee: user5, strength: 5.4)
connection6 = Connection.create(connector: user5 , connectee: user3, strength: 8.1)
connection7 = Connection.create(connector: user3 , connectee: user5, strength: 8.1)


#rejections
rejection1 = Rejection.create(rejector: user1, rejectee: user5, strength: 3.2)
rejection2 = Rejection.create(rejector: user2, rejectee: user1, strength: 7.5)
rejection3 = Rejection.create(rejector: user4, rejectee: user3, strength: 4.1)
rejection4 = Rejection.create(rejector: user3, rejectee: user2, strength: 1.1)
rejection5 = Rejection.create(rejector: user5, rejectee: user6, strength: 2.7)
rejection6 = Rejection.create(rejector: user6, rejectee: user1, strength: 4.0)




# User.destroy_all
# Artist.destroy_all
# UserArtist.destroy_all
# Connection.destroy_all
# Rejection.destroy_all
# Genre.destroy_all
# ArtistGenre.destroy_all

# # require 'rspotify'
# # #i had stored the RSpotify::authenticate inside spotify_setup.rb . if its somewhere else, then it can be taken out
# # require_relative './config/.spotify_setup.rb'
# # top_50_song = RSpotify::Playlist.find("spotifycharts", "37i9dQZEVXbLRQDuF5jeBp").tracks(limit:10).each {|i| Song.create(name: i.name)}
# # top_50_artist = RSpotify::Playlist.find("spotifycharts", "37i9dQZEVXbLRQDuF5jeBp").tracks(limit:10).each {|i| User.create(name: i.artists[0].name)}

# # counter = 0
# # while counter < 10 do
# #   UserSong.create(user:User.all[counter], song:Song.all[counter])
# #   counter += 1
# # end


# # t.string :name
# # t.integer :age
# # t.string :city
# # t.string :email
# # counter = 1
# user_array = []
# while counter < 6 do
#   user_array << User.create(name: "u#{counter}", age: counter + 20, city: "u#{counter}-city", email: "u#{counter}@gmail.com")
#   counter += 1
# end


# # # t.string :name
# # # t.integer :popularity
# # counter = 1
# # while counter < 6 do
# #   Artist.create(name: "a#{counter}", popularity: counter + 80)
# #   counter += 1
# # end

# # # create_table :user_artists do |t|
# # #   t.integer :user_id
# # #   t.integer :artist_id
# # counter = 0
# # while counter < 5 do
# #   UserArtist.create(user: User.all[counter], artist: Artist.all[counter])
# #   counter += 1
# # end

# # # create_table :connections do |t|
# # #   t.integer :connector_id, foreign_key: { to_table: 'users' }
# # #   t.integer :connectee_id, foreign_key: { to_table: 'users' }
# # #   t.float :strength
# # # end

# # counter = 0
# # while counter < 4 do
# #   Connection.create(connector: User.all[counter], connectee: User.all[counter + 1], strength: counter / 4.0)
# #   counter +=  1
# # end


# # # create_table :rejections do |t|
# # #   t.integer :rejector_id, foreign_key: { to_table: 'users' }
# # #   t.integer :rejectee_id, foreign_key: { to_table: 'users' }
# # #   t.float :strength
# # # end

# # counter = 0
# # while counter < 4 do
# #   Rejection.create(rejector: User.all[counter], rejectee: User.all[counter + 1], strength: counter / 4.0)
# #   counter +=  1
# # end

# # u1 = User.all[0]
# # u2 = User.all[1]
# # u3 = User.all[2]
# # u4 = User.all[3]
# # u5 = User.all[4]

# # a1 = Artist.all[0]
# # a2 = Artist.all[1]
# # a3 = Artist.all[2]
# # a4 = Artist.all[3]
# # a5 = Artist.all[4]

# # ua1 = UserArtist.all[0]
# # ua2 = UserArtist.all[1]
# # ua3 = UserArtist.all[2]
# # ua4 = UserArtist.all[3]
# # ua5 = UserArtist.all[4]

# # ua6 = UserArtist.create(user: u1, artist: a2)
# # ua7 = UserArtist.create(user: u1, artist: a3)
# # ua6 = UserArtist.create(user: u1, artist: a4)
# # ua6 = UserArtist.create(user: u2, artist: a1)

# # Connection.create(connector: u1, connectee:u3)
# # Connection.create(connector: u1, connectee:u4)
# # Connection.create(connector: u1, connectee:u5)
# # Connection.create(connector: u2, connectee:u1)

# # Rejection.create(rejector: u1, rejectee:u3)
# # Rejection.create(rejector: u1, rejectee:u4)
# # Rejection.create(rejector: u1, rejectee:u5)
# # Rejection.create(rejector: u2, rejectee:u1)

# # u1 = User.all[0]
# # u2 = User.all[1]
# # Connection.match?(u1,u2)
# # Connection.match?(u2,u1)


# # u3 = User.all[2]
# # u4 = User.all[3]
# # Connection.match?(u2,u3)

# # # t.string :name
# # # t.integer :popularity
# counter = 1
# while counter < 6 do
#   Artist.create(name: "a#{counter}", popularity: counter + 80)
#   counter += 1
# end


# # counter = 1
# # while counter < 6 do
# #   Genre.create(name: "g#{counter}")
# #   counter += 1
# # end

# # counter = 0
# # while counter < 5 do
# #   ArtistGenre.create(artist: Artist.all[counter], genre: Genre.all[counter])
# #   counter += 1
# # end


# # a1 = Artist.all[0]
# # g2 = Genre.all[1]

# # ArtistGenre.create(artist: a1, genre: g2)

# # u1 = User.create(name: "u1", age: 20, city: "Brick City", email: "u1@gmail.com")
# # u2 = User.create(name: "u2", age: 20, city: "Prick City", email: "u2@gmail.com")

# # a1 = Artist.create(name:"a1",popularity: 80)
# # a2 = Artist.create(name:"a2",popularity: 20)
# # a3 = Artist.create(name:"a3",popularity: 60)

# # ua1 = UserArtist.create(user: u1,artist: a1)
# # ua2 = UserArtist.create(user: u2,artist: a1)

# # g1 = Genre.create(name: "g1")
# # g2 = Genre.create(name: "g2")
# # g3 = Genre.create(name: "g3")

# # ag1 = ArtistGenre.create(artist: a2, genre: g1)
# # ag2 = ArtistGenre.create(artist: a2, genre: g2)
# # ag3 = ArtistGenre.create(artist: a2, genre: g3)

# # ag4 = ArtistGenre.create(artist: a2, genre: g1)
# # ag5 = ArtistGenre.create(artist: a2, genre: g2)



