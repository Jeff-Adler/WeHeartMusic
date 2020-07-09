require 'rspotify'
require 'pry'
require 'tty-prompt'
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

#this is for testing connection_calculator
me = User.create(name: "Jeff", age: 14, city: "montclair", email: "netscape.com")
you = User.create(name: "Chris", age: 14, city: "montclair", email: "netscape.com")
her = User.create(name: "Jill", age: 14, city: "montclair", email: "netscape.com")
him = User.create(name: "Craig", age: 14, city: "montclair", email: "netscape.com")
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
artist19 = Artist.create(name:"Ice Cube",popularity: 60)
UserArtist.create(user: me, artist: artist13)
UserArtist.create(user: me, artist: artist14)
UserArtist.create(user: me,artist: artist1)
UserArtist.create(user: me,artist: artist2)
UserArtist.create(user: me,artist: artist3)
UserArtist.create(user: you, artist: artist13)
UserArtist.create(user: you, artist: artist14)
UserArtist.create(user: you,artist: artist1)
UserArtist.create(user: you,artist: artist2)
UserArtist.create(user: you,artist: artist3)
UserArtist.create(user: him, artist: artist13)
UserArtist.create(user: him, artist: artist14)
UserArtist.create(user: her,artist: artist1)
UserArtist.create(user: her,artist: artist2)
UserArtist.create(user: her,artist: artist3)
Connection.create(connector:you, connectee:me)
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

#This simply prints your matches by calling User#matches
def print_matches(user)
    matches = user.matches
    matches.each do |match|
        puts "#{match.name}"
    end
end

#This method lets the user decide if they will connect with or reject a propsect
# def connect_or_reject(user,prospect)
#     puts "Would you like to connect with this prospect? (y/n)"
#     response = gets.chomp.to_s
#     if response == "y"
#         Connection.create(connector: user, connectee: prospect, strength: connection_calculator(user,prospect))
#     elsif response == "n"
#         Rejection.create(rejector: user,rejectee: prospect, strength: connection_calculator(user,prospect))
#     else
#         puts "I didn't quite get that"
#         connect_or_reject(user, prospect)
#     end
# end

#This method will find a prospect for the user
def find_prospects(user_1)
    strength_counter = 0
    temp_prospect = nil
    User.all.each do |user|
    #This makes sure that a) we are not comparing the user to itself and 
    #b) we are ignoring prospects the user already connected or rejected
        
        if (user == user_1) || user_1.connectee?(user) ||  user_1.rejectee?(user)
            next
        else
            score = connection_calculator(user_1,user)
            if strength_counter < score
                strength_counter = score
                temp_prospect = user
            end
        end
    end
    if temp_prospect == nil
        puts "Sorry, we could not find any prospects."
    else
        puts "Your match is: #{temp_prospect.name}. Your connection strength with #{temp_prospect.name} is #{strength_counter}."
        temp_prospect
    end
end

#This method will measure the strength of a connection between two users. Needs to be fixed
def connection_calculator(user_1,user_2)

   score=0

    #This stores all the artists that user_1 and user_2 have in common
    artist_matches = user_1.artists.select do |user_1_artist|
        #This loop will return true whenever an artist of user_2 matches the current of user_1_artist
        user_2.artists.any? do |user_2_artist|
            user_1_artist == user_2_artist
        end
    end

    if !(artist_matches == nil || artist_matches.empty?)
        artist_matches.each do |artist|
            score += (3 * (100 - artist.popularity)/100)
        end

    else #this would be the compare-genre condition: to be updated
        score = 0

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
     end
   score
end

#This artist prompts the user to pick an artist to add to their playlist.
def choose_artist(nu)
   puts "Choose an artist you'd like to add to your favorites list:"
   artist = gets.chomp.to_s
   ao = RSpotify::Artist.search(artist)

  
    begin 
        puts "Confirming choice #{ao.first.name} (y/n)?"
    rescue NoMethodError
        puts "Please type a different artist"
        choose_artist(nu)
    end

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

#This ensures another user does not have the same e-mail address. Should be combined with email_verification
def email_taken(email)
    User.all.any? do |user|
        user.email == email
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

    #This will prompt them for a different email address until they enter one that has not been taken
    while email_taken(e) == true do
        puts "Sorry that email is taken. Please enter another:" 
        e = gets.chomp
    end
    
    nu = User.create(name: n, age: a, city: c, email: e)
    puts "Your account was successfully created, #{nu.name}!"
    nu
end

#This should give the user options
def main_menu(user)
    puts "Please select from the following options:"
    puts "1: See my playlist"   
    puts "2: See my connections"  
    puts "3: See my matches"  
    puts "4: Search for new prospects"  
    puts "5: See my account information"
    response = gets.chomp.to_s

    if response == "1"
        puts user.artists.map{|artist| artist.name}
    elsif response == "2"
        puts user.connectees.map{|connectee| connectee.name}
    elsif response == "3"
        print_matches(user)
    elsif response == "4"
        find_prospects(user)
    elsif response == "5"
        puts "Name: #{user.name}"
        puts "Age: #{user.age}"
        puts "City: #{user.city}"
        puts "Email: #{user.email}"
    else
        puts "Sorry, I didn't get that."
        main_menu(user)
    end

end

#This prompts a returning user with the main menu
def returning_user (existing_user)
    puts "Nice to see you again #{existing_user.name}!"
    existing_user
end

#This method ensures the e-mail address was found in our system, and calls itself till a valid e-mail is found
def email_verification(email)
    existing_user = User.all.find {|user| user.email == email}
    if existing_user == []
        puts "Sorry, I don't recognize that e-mail address."
        puts "Please re-enter your e-mail address."
        email = gets.chomp.to_s
        email_verification(email)
    else
        existing_user
    end
end


def user_status
    us = gets.chomp.to_s
    if !(us == "n" || us == "y")
        puts "Error. Invalid response, try again."
        user_status
    end
    us
end

def welcome
    puts "Welcome to the Spotify Dating App!"
    puts "If you need help at any time, simply type 'help' into the console."
    puts "Are you a new user? (y/n)"
end

##################################################

def runner 
    
    #This resets the database. We will want to delete this in the final product
    refresh_database

    #This seeds the database for testing purposes.
    seed

    #This is to be able to reference the user outside the scope of any single loop or method
    me = nil

    #Welcome message
    welcome

    #Prompts the user whether they are a returning user or not
    us = user_status

    if us == "y"
        puts "Fantastic! Let's get your information."

        #this sets the me variable to a User object
        me = new_user

        puts "Let's build your playlist!"

        #this will run as many times as necessary to fill their playlist
        3.times do
            choose_artist(me)
        end

        puts "Now let's find people with similar music choices to you!"

        prospect = find_prospects(me)

        #This prompts you to connect or reject with prospect, assuming a prospect was found     
        if prospect != nil
            connect_or_reject(me, prospect)
        end

        #This will allow them to continue finding to prospects until they decide to stop
        puts "Want to find more prospects? (y/n)"
        response = gets.chomp.to_s
        while response == "y" do
            prospect = find_prospects(me)

        #This will prompt you to connect or reject the prospect, or it will exit the loop if there are no remaining prospects
            if prospect != nil
                connect_or_reject(me, prospect)
            else
                break
            end
    
            puts "Want to find more prospects? (y/n)"
            response = gets.chomp.to_s
        end

        #THIS IS FOR TESTING PURPOSES TO TEST print_matches
        user1 = User.all[0]
        user2 = User.all[1]
        user3 = User.all[2]
        user4 = User.all[3]
        user5 = User.all[4]
        user6 = User.all[5]
        user7 = User.all[6]
        user8 = User.all[7]

        connection1 = Connection.create(connector: user1 , connectee: me, strength: 7.5)
        connection2 = Connection.create(connector: user2 , connectee: me, strength: 6.3)
        connection3 = Connection.create(connector: user3 , connectee: me, strength: 9.2)
        connection4 = Connection.create(connector: user4 , connectee: me, strength: 7.3)
        connection5 = Connection.create(connector: user5 , connectee: me, strength: 5.4)
        connection6 = Connection.create(connector: user6 , connectee: me, strength: 8.1)
        connection7 = Connection.create(connector: user7 , connectee: me, strength: 8.1)

        #This will tell the user everyone they are (mutually matched) with
        puts "Your mutual matches are:"
        print_matches(me)
    elsif us == "n" #this means you're a retuning user
        puts "Welcome back! Please enter your e-mail to log-in."
        email = gets.chomp.to_s
        email = email_verification(email)
        #this sets the me variable to the user associated with this email, after its been verified
        me = returning_user(email)
    end

    main_menu(me)

    #This prompts them to return to the main_menu or exit the program
    puts "Would you like to return to the menu? (y/n)"
    response = user_status

    #This loop will continue to present the main menu until the user chooses "n". It will not start if user enters
    #"n" in the previous call to user_status
    while response != "n"
        main_menu(me)
        puts "Would you like to return to the menu? (y/n)"
        response = user_status
    end
    puts "Goodbye!"
end
