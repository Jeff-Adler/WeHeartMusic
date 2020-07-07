require_relative 'config/environment'
require 'sinatra/activerecord/rake'
require 'pry'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end


desc 'seed the database with values from spotify'
  task :seed do
    User.destroy_all
    Song.destroy_all
    UserSong.destroy_all
    require 'rspotify'
    #i had stored the RSpotify::authenticate inside spotify_setup.rb . if its somewhere else, then it can be taken out
    require_relative './config/application.rb'
    top_50_song = RSpotify::Playlist.find("spotifycharts", "37i9dQZEVXbLRQDuF5jeBp").tracks(limit:10).each {|i| Song.create(name: i.name)}
    top_50_artist = RSpotify::Playlist.find("spotifycharts", "37i9dQZEVXbLRQDuF5jeBp").tracks(limit:10).each {|i| User.create(name: i.artists[0].name)}
    
    counter = 0
    while counter < 10 do
      UserSong.create(user:User.all[counter], song:Song.all[counter])
      counter += 1
    end

  end