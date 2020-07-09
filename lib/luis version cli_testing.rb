require 'tty-prompt'
require 'rspotify'

class CLI
    @@prompt = ""
    @@user_id = ""

 
def self.welcome

@@prompt = TTY::Prompt.new

self.logo
puts <<-welcomingtext
Welcome to the Spotify Dating App!
welcomingtext


answer = @@prompt.select('Are you a new user or returning??', ["New User","Returning"])

case answer
when "New User"
    new_user
else
    system "clear"
    self.singer
    returning_user
end


end

def self.new_user
    puts <<-welcoming 
    Excellent! Happy to have you join us. Let's ask you a few questions so we can set you up with a new account.
    First things first ...
    welcoming
   
    n = @@prompt.ask('What\'s your name?',required: true).capitalize
    a = @@prompt.ask('age?',required: true).to_i
    c =@@prompt.ask('city?',required: true).capitalize
    e =@@prompt.ask('whats your email?',required: true).downcase

    if User.email_exist?(e)
        puts "Sorry, but that email seems to be taken. We'll return you to the main menu and you can try again"
        self.pause_time
        self.welcome
    else
        @@user_id =User.verify_user(n,a,c,e)
    end



    system "clear"
    puts "Great! Nice to meet you #{n}. We've successfully created an account for you. Now let's focus on building your Top 10 bands and get you closer to making some matches"
    rock_hands
    self.pause_time
    choose_artist
end

def self.returning_user
    puts <<-welcoming
Before we can continue,
    welcoming

    email = @@prompt.ask('What\'s your email?',required: true).downcase
    answer = User.find_by(email: email)
    if answer
        @@user_id = answer
        puts "Log in successful. \n Ok #{answer.name}, lets go to the options."
        self.inner_menu
    else
        puts "Sorry, but we can't find that email. Please try again"
        sleep(2)
        self.returning_user
    end
end

    def self.inner_menu
        answer = @@prompt.select("Welcome to the menu #{@@user_id.name}, what would you like to do?", ["Manage Songs","Add Songs","Manage Connections","Add Connections", "exit"], required: true)
        case answer
        when "Manage Songs"
            puts "this would be where we make the Top 10 Artist manager method"
            #below comment is to trick a list of the songs that exist in UserArtists
            #luis = UserArtist.where(user_id: 23).map{|i| i.artist.name}
            
            @@prompt.select("Welcome to the song manager. here are the songs you have", luis)
        when
            "Add Songs"
            self.choose_artist
        when
            "Manage Connections"
            puts "this would be where we make the manage connections method"
        when "Add Connections"
            puts "this would be where we make the manage connections method"
        else
            "this will end the program"

        end
    end






def self.choose_artist
    artist = @@prompt.ask("Please choose an artist you'd like to add to your favorites list \n", required: true)
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
         na = Artist.verify_artist(ao_result[answer])
         
         if UserArtist.verified_create(@@user_id,na)
            answer = @@prompt.select('Artist was successfully added to your Top 10! Do you want to add another song or go back to the menu?', ["Add Another Song","Back to Menu"], required: true)
            case answer
            when "Add Another Song"
                self.choose_artist
            else
                self.inner_menu
            end
        else
            if UserArtist.top10_filled?(@@user_id)
                puts "Sorry, but your list is full. Please return to the main menu and edit your existing links"
            else
                puts "Sorry, but you already seem to have this song in your Top 10. Let's go back to the menu and manage your songs"
            end
            self.inner_menu
        end

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