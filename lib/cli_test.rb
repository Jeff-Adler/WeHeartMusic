require 'rspotify'
require 'pry'
require_relative '../config/environment'
require_relative '../app/models/user.rb'
require_relative '../app/models/artist.rb'
require_relative '../app/models/user_artist.rb'
require_relative '../app/models/genre.rb'
require_relative '../app/models/artist_genre.rb'
require_relative '../app/models/connection.rb'
require_relative '../app/models/rejection.rb'
# require 'tty-prompt'
# prompt = TTY::Prompt.new

# User.destroy_all
# Artist.destroy_all

def refresh_database
    User.destroy_all
    Artist.destroy_all
    UserArtist.destroy_all
    Connection.destroy_all
    Rejection.destroy_all
    Genre.destroy_all
    ArtistGenre.destroy_all
end

#test method
def seed
    u1 = User.create(name: "u1", age: 20, city: "Brick City", email: "u1@gmail.com")
    u2 = User.create(name: "u2", age: 20, city: "Prick City", email: "u2@gmail.com")
    a1 = Artist.create(name:"a1",popularity: 80)
    a2 = Artist.create(name:"a2",popularity: 20)
    a3 = Artist.create(name:"a3",popularity: 60)
    ua1 = UserArtist.create(user: u1,artist: a1)
    ua2 = UserArtist.create(user: u2,artist: a1)
    ua3 = UserArtist.create(user: u1,artist: Artist.all[0])
  end

def help
    puts "Options:"
    puts "'welcome' - restarts prompts"
    puts "'clear' - quits prompt"
    puts "'new_user' - creates account for new user"
    puts "'returning_user' - log-in for returning users"
    puts "'choose_artist' - add artist to list of favorites"
    puts "'help' - return all options"
end

#This method will tell your matches
def matches(user)
    Connection.all.each do |connection|
        if Connection.match?(user,connection) == true
            print connection.connectee.name
        end
    end
end

#This method lets the user decide if they will connect with or reject a propsect
def connect_or_reject(user,prospect)
    puts "Would you like to connect with this prospect? (y/n)"
    response = gets.chomp.to_s
    if response == "y"
        Connection.create(connector: user, connectee: prospect, strength: connection_calculator(user,prospect))
    elsif response == "n"
        Rejection.create(rejector: user,rejectee: prospect, strength: connection_calculator(user,prospect))
    else
        puts "I didn't quite get that"
        connect_or_reject(prospect)
    end
end

#This method will find a prospect for the user
def find_prospects(user_1)
    strength_counter = 0
    temp_prospect = nil
    User.all.each do |user|
        if (user == user_1) || user_1.connections.any?{|connection|connection == user} ||  user_1.rejections.any?{|rejection|rejection == user}

        else
            score = connection_calculator(user_1,user)
            if strength_counter < score
                strength_counter = score
                temp_prospect = user
            end
        end
    end
    if temp_prospect == nil
        puts "Sorry, we could not find any matches/"
    else
        puts "Your match is: #{temp_prospect.name}. #{temp_prospect.name} is a fan of #{temp_prospect.artists[0].name}."
    end
end

#This method will measure the strength of a connection between two users. Needs to be fixed
def connection_calculator(user_1,user_2)

    40
#    score=0

#     artist_matches = user_1.artists.select do |user_1_artist|
#         user_2.artists.any? do |user_2_artist|
#             user_1_artist == user_2_artist
#         end
#     end

#     if !(artist_matches == nil)
#         artist_matches.each do |artist|
#             score += (3 * (100 - artist.popularity)/100)
#         end
#     else

#         user_1_genres = []
#         user_1.artist.each do |artist|
#             artist.genres.each do |genre|
#                 user_1_genres << genre
#             end
#         end

#         user_2_genres = []
#         user_2.artist.each do |artist|
#             artist.genres.each do |genre|
#                 user_2_genres << genre
#             end
#         end

#         score += 1 - ((user_1_genres - user_2_genres).size / user_1_genres.size)
#     end
#     score
end

#This artist prompts the user to pick an artist to add to their playlist.
def choose_artist(nu)
   puts "Choose an artist you'd like to add to your favorites list:"
   artist = gets.chomp.to_s
   ao = RSpotify::Artist.search(artist)
   #this ensures RSpotify returned a valid artist, otherwise program breaks
   if ao == nil
    choose_artist(nu)
   end
  
    puts "Confirming choice #{ao.first.name} (y/n)?"
    answer = gets.chomp.to_s

    if answer == "n"
        choose_artist(nu)
    elsif answer == "y"
        match = Artist.all.find do |a|
            a.name == ao.first.name
        end

        #artist does not already exist
        if match == nil
            na = Artist.create(name: ao.first.name, popularity: ao.first.popularity)
            UserArtist.create(user: nu, artist: na)

            #we have to check whether to make NEW genre entries or JUST artistgenre connections
            artist_object = ao.first
            #this will loop through every genre of artist the user selected
            artist_object.genres.each do |genre_element|
                #this will loop through every genre in the database
                genre_match = Genre.all.find do |g|
                    g.name == genre_element
                end
                    #this will check if the genre was found in the database. If nil, it means it was not
                    if genre_match == nil
                        genre_var = Genre.create(name: genre_element)
                        ArtistGenre.create(artist: na, genre: genre_var)
                    else
                        ArtistGenre.create(artist: na, genre: genre_match)
                    end
            end
        else
            UserArtist.create(user: nu, artist: match)
        end
  
    else
        puts "Invalid answer. Try again."
        choose_artist(nu)
    end
    
end

def new_user
    puts "What's your name?"
    n = gets.chomp.to_s
    puts "What's your age?"
    a = gets.chomp.to_i
    puts "What's your city?"
    c = gets.chomp.to_s
    puts "What's your email?"
    e = gets.chomp

    nu = User.create(name: n, age: a, city: c, email: e)
    puts "Your account was successfully created #{nu.name}!"

end

def returning_user (email)
    ru = User.all.select {|u| u.email == email}
        if ru != email
            welcome
        else
            puts "Nice to see you again #{ru}!"
            choose_artist(ru)
        end
    #choose connections?
end


def user_status (us)
    if us == "n"
        puts "Welcome back! Please enter your email to log-in."
        email = gets.chomp.to_s
        returning_user(email)
    elsif us == "y"
        puts "Fantastic!"
        us
    else
        puts "Error. Invalid response, try again."
        user_status(us)
    end
end

def welcome
    puts "Welcome to the Spotify Dating App!"
    puts "If you need help at any time, simply type 'help' into the console."
    puts "Are you a new user? (y/n)"
    us = gets.chomp.to_s
    user_status(us)
end

