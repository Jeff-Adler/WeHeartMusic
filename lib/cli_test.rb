require 'rspotify'
require 'pry'
require 'tty-prompt'
require_relative '../config/environment'
require_relative '../app/models/user.rb'
require_relative '../app/models/artist.rb'
require_relative '../app/models/user_artist.rb'
require_relative '../app/models/connection.rb'
require_relative '../app/models/rejection.rb'

prompt = TTY::Prompt.new

# User.destroy_all
# Artist.destroy_all
# UserArtist.destroy_all
# Connection.destroy_all
# Rejection.destroy_all



# def help
#     puts "Options:"
#     puts "'welcome' - restarts prompts"
#     puts "'clear' - quits prompt"
#     puts "'new_user' - creates account for new user"
#     puts "'returning_user' - log-in for returning users"
#     puts "'choose_artist' - add artist to list of favorites"
#     puts "'help' - return all options"
# end

# def choose_artist(nu)
#    puts "Choose an artist you'd like to add to your favorites list:"
#    artist = gets.chomp.to_s
#    ao = RSpotify::Artist.search(artist)
    
#     puts "Confirming choice #{ao.first.name} (y/n)?"
#     answer = gets.chomp.to_s

#     if answer == "n"
#         choose_artist(nu)
#     elsif answer == "y"
#         match = Artist.all.find do |a|
#             a.name == ao.first.name
#         end
#         #artist does not exist
#         if match == nil
#             na = Artist.create(name: ao.first.name, popularity: ao.first.popularity)
#             UserArtist.create(user: nu, artist: na)
#         else
#             UserArtist.create(user: nu, artist: match)
#         end
  
#     else
#         puts "Invalid answer. Try again."
#         choose_artist(nu)
#     end
    
# end

# def new_user
#     puts "What's your name?"
#     n = gets.chomp.to_s
#     puts "What's your age?"
#     a = gets.chomp.to_i
#     puts "What's your city?"
#     c = gets.chomp.to_s
#     puts "What's your email?"
#     e = gets.chomp

#     nu = User.create(name: n, age: a, city: c, email: e)
#     puts "Your account was successfully created #{nu.name}!"
#     choose_artist(nu)
# end

# def returning_user (email)
#     ru = User.all.select {|u| u.email == email}
#         if ru != email
#             welcome
#         else
#             puts "Nice to see you again #{ru}!"
#             choose_artist(ru)
#         end
#     #choose connections?
# end


# def user_status (us)
#     if us == "n"
#         puts "Welcome back! Please enter your email to log-in."
#         email = gets.chomp.to_s
#         returning_user(email)
#     elsif us == "y"
#         puts "Fantastic!"
#         new_user
#     else
#         puts "Error. Invalid response, try again."
#         welcome
#     end
# end

# def welcome
#     puts "Welcome to the Spotify Dating App!"
#     puts "If you need help at any time, simply type 'help' into the console."
#     puts "Are you a new user? (y/n)"
#     us = gets.chomp.to_s
#     user_status(us)
# end


# #new_user

#welcome

# #binding.pry

class CLI
    @@prompt = ""
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
def self.peace_hands
    puts <<-art
                 __                                        __ 
                |--|                                      |--|
     .._       o' o'                     (())))     _    o' o'
    //\\\    |  __                      )) _ _))  ,' ; |  __  
   ((-.-\)  o' |--|  ,;::::;.          (C    )   / /^ o' |--| 
  _))'='(\-.  o' o' ,:;;;;;::.         )\   -'( / /     o' o'
 (          \       :' o o `::       ,-)()  /_.')/                 .
 | | .)(. |\ \      (  (_    )      /  (  `'  /\_)    .:izf:,_  .  |
 | | _   _| \ \     :| ,==. |:     /  ,   _  / 1  \ .:q568Glip-, \ |
 \ \/ '-' (__\_\____::\`--'/::    /  /   / \/ /|\  \-38'^"^`8k='  \L,
  \__\\[][]____(_\_|::,`--',::   /  /   /__/ <(  \  \8) o o 18-'_ ( /
   :\o*.-.(     '-,':   _    :`.|  L----' _)/ ))-..__)(  J  498:- /]
   :   [   \     |     |=|   '  |\_____|,/.' //.   -38, 7~ P88;-'/ /
   :  | \   \    |  |  |_|   |  |    ||  :: (( :   :  ,`""'`-._,' /
   :  |  \   \   ;  |   |    |  |    \ \_::_)) |  :  ,     ,_    /
   :( |   /  )) /  /|   |    |  |    |    [    |   \_\      _;--==--._ 
MJP:  |  /  /  /  / |   |    |  |    |    Y    |CJR (_\____:_        _:
   :  | /  / _/  /  \   |lf  |  |  CJ|mk  |    | ,--==--.  |_`--==--'_|
                                                         "   `--==--'    
art
end
def self.welcome
@@prompt = TTY::Prompt.new
puts <<-welcomingtext
Welcome to the Spotify Dating App!
If you need help at any part, please type -help for assistance.
welcomingtext
answer = @@prompt.select('Are you a new user?', ["Yes","no"])
if answer == "Yes"
    new_user
else
    returning_user
end
end
def self.new_user
    puts <<-welcoming 
    Excellent! Happy to have you join us. Let's ask you a few questions so we can set you up with a new account.
    First things first ...
    welcoming
    n = @@prompt.ask('What\'s your name?',required: true)
    a = @@prompt.ask('age?',required: true)
    c =@@prompt.ask('city?',required: true)
    e =@@prompt.ask('whats your email?',required: true)
    answer = User.create(name: n, age: a, city: c, email: e)
    puts "Great! Nice to meet you #{n}. We've successfully created an account for you. Now let's focus on building your Top 10 bands and get you closer to making some matches"
    rock_hands
    choose_artist(answer)
end
def self.returning_user
    puts <<-welcoming
    Welcome back! Before we can continue,
    welcoming
    email = @@prompt.ask('What\'s your email?',required: true)
    answer = User.all.find {|u| u.email == email}
    puts "Log in successful. lets go to the options"
    choose_artist(answer)
end
def self.choose_artist(user)
    puts "this is where we have them do the spotify search"
end
end
CLI.welcome