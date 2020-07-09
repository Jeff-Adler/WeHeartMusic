require 'tty-prompt'
require 'rspotify'

module Cli
    @@prompt = ""
    @@user = ""

 
def self.welcome

@@prompt = TTY::Prompt.new

self.logo
puts <<-welcomingtext
Welcome to the Spotify Dating App!
welcomingtext


answer = @@prompt.select('Are you a new user or returning??', ["New User","Returning","Exit"], require: true)

case answer
when "New User"
    new_user
    choose_artist
when "Returning"
    system "clear"
    self.singer
    self.returning_user
    self.inner_menu
else
    exit
end


end

def self.new_user
    puts <<-welcoming 
    Excellent! Happy to have you join us. Let's ask you a few questions so we can set you up with a new account.
    First things first ...
    welcoming
   
    n = @@prompt.ask('What\'s your name?',required: true).capitalize
    a = @@prompt.ask('age?',required: true).to_i
    c = @@prompt.ask('city?',required: true).capitalize
    e = @@prompt.ask('whats your email?',required: true).downcase

    if User.email_exist?(e)
        puts "Sorry, but that email seems to be taken. We'll return you to the login screen and you can try again"
        self.pause_time
        self.welcome
    else
        @@user =User.verify_user(n,a,c,e)
    end



    system "clear"
    puts "Great! Nice to meet you #{n}. We've successfully created an account for you. Now let's focus on building your Top 10 bands and get you closer to making some matches"
    rock_hands
    self.pause_time
end

def self.returning_user
    puts <<-welcoming
Before we can continue,
    welcoming

    email = @@prompt.ask('What\'s your email?',required: true).downcase
    answer = User.find_by(email: email)
    if answer
        @@user = answer
        puts "Log in successful. \n Ok #{answer.name}, lets go to the options."
    else
        puts "Sorry, but we can't find that email. Please try again"
        sleep(2)
        self.returning_user
    end
end



def self.change_top_10
            #below comment is to trick a list of the songs that exist in UserArtists
            #luis = UserArtist.where(user_id: @@user.id).map{|i| i.artist.name}
            var = @@user.artists.map{|artist| artist.name}

            puts "Welcome to the Top 10 manager. Here are your Top 10 artists:"
            var.each do |name|
                puts name
            end

            #@@prompt.select("Welcome to the Top 10 manager. Here are your Top 10 artists", var)
            var2 = @@prompt.select("Do you want to change your Top 10 or return to main menu?", ["Change Top 10","Return to Main Menu"],required: true)
            case var2
            when "Change Top 10"
                #placeholder: change_top_10
            end
end


    def self.inner_menu
        answer = @@prompt.select("Welcome to the menu #{@@user.name}, what would you like to do?", ["View Top 10","View Connections & Matches","Add Artists","Find Connections", "See my account information","Return to login screen"], required: true)
        case answer
        when "View Top 10"
            self.change_top_10
        when "View Connections & Matches"
            var = @@user.connectees.map{|connectee| connectee.name}

            puts "Here is everyone you added to your connections:"
            var.each do |name|
                puts name
            end

            puts "Here are the connection(s) that like you back. Send them an e-mail!"
            self.print_matches(@@user)
        when
            "Add Artists"
            self.choose_artist
        # when #This will allow you to accept or reject pending requests
        #     "Manage Connections"
        #     puts "this would be where we make the manage connections method"
        when "Find Connections"
            puts "Let's find people with similar music tastes to you!"

            #finds the user in the database with strongest connection, that you have not yet encountered
            prospect = find_prospects(@@user)

            #This prompts you to connect or reject with prospect, assuming a prospect was found     
            if prospect != nil
                connect_or_reject(@@user, prospect)
            end

            #This will allow them to continue finding to prospects until they decide to stop
            puts "Want to find more prospects? (y/n)"
            response = gets.chomp.to_s
            while response == "y" do
                prospect = find_prospects(@@user)

            #This will prompt you to connect or reject the prospect, or it will exit the loop if there are no remaining prospects
            if prospect != nil
                connect_or_reject(@@user, prospect)
            else
                break
            end
    
            puts "Want to find more prospects? (y/n)"
            response = gets.chomp.to_s
        end
        when "See my account information"
            self.display_account_info
        else
            Cli.welcome
        end
        sleep(2)
        self.inner_menu
    end

def self.display_account_info
    puts "Name: #{@@user.name}"
    puts "Age: #{@@user.age}"
    puts "City: #{@@user.city}"
    puts "Email: #{@@user.email}"
end

#This prints your matches by calling User#matches
def self.print_matches(user)
    matches = user.matches
    matches.each do |match|
        puts "#{match.name}: #{match.email}"
    end
end

def self.choose_artist
    artist = @@prompt.ask("Please choose an artist you'd like to add to your Top 10 \n", required: true)
    ao = RSpotify::Artist.search(artist)
    ao_result = ao.first(3)
    ao_hash = ao_result.each_with_object({}){|key,container| container[key.name] = ao_result.find_index(key) }
    ao_hash["try again"] = "try again"
     answer = @@prompt.select("Please Confirm your choice:", ao_hash,required: true)
     case answer
     when "try again"
        puts "Sorry, let's try again."
        self.pause_time
        self.choose_artist
     else
        #this will send the artist object from spotify and give it to a method in User that checks to see if it exists or not.
        #verify_artist will either return a NEW artist or an existing artist (if it's already in the database)
         na = Artist.verify_artist(ao_result[answer])
         
         #The #verify methods verify AND create the objects. Either returns the UserArtist or returns nil, if connection already exists
         if UserArtist.verified_create(@@user,na)
            answer = @@prompt.select('Artist was successfully added to your Top 10! Do you want to add another artist or go back to the menu?', ["Add Another Artist","Back to Menu"], required: true)
            case answer
            when "Add Another Artist"
                self.choose_artist
            end
        else
            if UserArtist.top10_filled?(@@user)
                puts "Sorry, but your list is full. Please return to the main menu and edit your existing artists."
            else
                answer = @@prompt.select('Sorry, but you already seem to have this artist in your Top 10. Do you want to add another artist or go back to the menu?', ["Add Another Artist","Back to Menu"], required: true)
                case answer
                when "Add Another Artist"
                    self.choose_artist
                end
            end
        end
        self.inner_menu
     end

     #This method lets the user decide if they will connect with or reject a propsect
def connect_or_reject(user,prospect)
    answer = @@prompt.select('Would you like to connect or pass on this person', ["Connect","Pass"], required: true)
    case answer
    when "Connect"
        Connection.create(connector: user, connectee: prospect, strength: connection_calculator(user,prospect))
    else
        Rejection.create(rejector: user,rejectee: prospect, strength: connection_calculator(user,prospect))
    end
    # puts "Would you like to connect with this prospect? (y/n)"
    # response = gets.chomp.to_s
    # if response == "y"
    #     Connection.create(connector: user, connectee: prospect, strength: connection_calculator(user,prospect))
    # elsif response == "n"
    #     Rejection.create(rejector: user,rejectee: prospect, strength: connection_calculator(user,prospect))
    # else
    #     puts "I didn't quite get that"
    #     connect_or_reject(user, prospect)
    # end
end

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
        puts "Your match is: #{temp_prospect.name}. Your connection strength with #{temp_prospect.name} is #{strength_counter}/10."
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
     
 end





 private

 def self.pause_time
    sleep(2)
        system "clear"
 end

 def self.logo
    puts <<-welcome
              SpotifySpotifySpotifySpotify                 SpotifySpotifySpotifySpotify
            ifySpotifySpotifySpotifySpotify            SpotifySpotifySpotifySpotifySpotify
        ifySpotifySpotifySpotifySpotifySpotifySpo    tifySpotifySpotifySpotifySpotifySpotify
       SpotifySpotifySpotifySpotifySpotifySpotifySpo  tifySpotifySpotifySpotifySpotifySpotify
       ifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotify
       SpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpot
       ifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySp
        otifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotify
        SpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpoti
        fySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpot
          ifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotify
            ySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotify
             ifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpot
              fySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotif
                ySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotif
                fySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpot
                   ifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpoti
                    fySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySp
                      otifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySp
                       otifySpotifySpotifySpotifySpotifySpotifySpotifySpotifySpotif
                         ySpotifyifySpotifySpotifySpotifySpotifySpotifySpotifySpot
                           ifySpotifySpotifySpotifySpotifySpotifySpotifySpotify
                              SpotifySpotifySpotifySpotifySpotifySpotifySpot
                                ifySpotifySpotifySpotifySpotifySpotifySpot
                                    ifySpotifySpotifySpotifySpotifySpo
                                    tifySpotifySpotifySpotifySpotify
                                      SpotifySpotifySpotifySpotify
                                            SpotifySpotify
                                                Spotify
welcome
 end

   
    
def self.rock_hands

    puts <<-Rock
░░░▄▀▀▀▄░░░░░░░░░░░░░▄▀▀▀▄░░░░░░
░░░█░░░██░░░░░░░░░░░░█░░░█░░░░░░
░░░▀█░░░█░░░░░░░░░░░█▀░░░█░░░░░░
░░░░█░░░▀█▄▄▄▄░▄▄▄▄▄█░░░█▀░░░░░░
░░░░█░░░░██░░▀█▀░░██▀░░▄█░░░░░░░
░░░░░█░░░▀█░░░█░░░██░░░█░░░░░░░░
░░░░░█░░░░█░░░█░░░█░░░░█░░░░░░░░
░░░░▄█░░░░█▄░▄█▄░▄█░░▄█▀▀██▄░░░░
░░░░█░░░░░░▀▀▀▀▀▀▀░░░█▄░░░░█▄░░░
░░░░█░░░░░░░░░░░░░░░░▀█▄▄░░░█░░░
░░░░█░░░░░░░░░░░░░░░░░░░░░░▄█░░░
░░░░█░░░░░░░░░░░░░░░░░░░░░░█░░░░
░░░░░█░░░░░░░░░░░░░░░░░░░▄██░░░░
░░░░░▀▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄██▀▀▀░░░░░░
░░░░░░█████████████▀░░░░░░░░░░░░
░░░░░░██▀▀█████████░░░░░░░░░░░░░
Rock
end
def self.singer
    puts <<-art
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    @@@@@@@@@@@@@@@@@@@             @@@@@@@@@@@@@@@@@@
    @@@@@@@@@@@@@@@@                   @@@@@@@@@@@@@@@
    @@@@@@@@@@@@@@                          @@@@@@@@@@
    @@@@@@@@@@@@@@#                         @@@@@@@@@@
    @@@@@@@@@@@@@@@                         .@@@@@@@@@
    @@@@@@@@@@@@@@                         *(&@@@@@@@@
    @@@@@@@@@@@@@@@%                     .(@@@@@@@@@@@
    @@@@@@@@@@@@@@                      @@#@@@@@@@@@@@
    @@@@@@@@@&                          @@@@@@@@@@@@@@
    @@@@@@.                           * @@@@@@@@@@@@@@
    @@@,                             @@@@@@@@@@@@@@@@@
    /                      @@@%   @@@@@@@@     @@@@@@@
                          @@@@@@@@@@@@@@@@         @@@
                          @@@@@@@@@@@@@@@@@@         (
                           @@@@@@@@@@@@@@@          ,/
                            @@@@@@@@@@@@@@           @
                            @@@@@@@@@@@@@@&          @
                             @@@@@@@@@@@@         @@  
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                         
art
end

end