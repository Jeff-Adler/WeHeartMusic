# spotify_dating_app

Lovers of music and lovers of love, look no further. The Spotify Dating App is here to connect you to other users who share the same musical interets as yourself. Simply create a profile, add artists to your Top 10 list and search for connections. It's as easy as a-one, two, a-one, two, three, four!

# Table of Contents

* Installation
* Guide
* License & Information for Contributors

## Installation

This program runs on Ruby using a CLI. It works for both Mac and Windows users. There are however a few crucial gems that will need installation in order for the program to function properly. These gems are already included within the Gemfile, but it's important for new users to be aware of them. 

### RSpotify
This gem allows you to connect to the Spotify API in order to grab artist, genre, and other important information/functions for Spotify. For more installation information:
- Make sure you have the following added in the Gemfile: gem 'rspotify'
- Execute the following in your terminal: bundle
- You can also install it yourself in the terminal like so: gem install 'rspotify'
- For more information on documentation, check out the site <a href="https://www.rubydoc.info/github/guilhermesad/rspotify/master">here</a>

### TTY::Prompt
This gem creates a visually appealing CLI. Most of the functionality of the CLI is dependent on this gem working properly. If needed, more installation information is provided here:
- Make sure you have the following added in the Gemfile: gem 'tty-prompt'
- Execute the following in your terminal: bundle
- You can also install it yourself in the terminal like so: gem install 'tty-prompt'
- For more information on documentation, check out the site <a href="https://github.com/piotrmurach/tty-prompt">here</a>


## Guide

The Spotify Dating App has a lot of great features at your disposal. Here are some quick tips so that you get the most out of the application:

- To start the application, excute the following in the terminal: ruby bin/run.rb
- This will take you to the log-in screen, where you can create a new user, log-in if you are a returning user or exit the application. NOTE: this is the only menu where you can exit the application.
- After creating a new user/adding artists or logging in as an existing user with your credentials, you'll be taken to the main menu. From here you have the following options:
    * View or Change your Top 10: View or delete artists from your Top 10 list.
    * Add Artists: Add artists to your Top 10 list
    * View Genres: View the genres you are interested in.
    * View Connections & Matches: View your current connections (users you have similar taste with), and matches (when both users have confirmed to match after having already connected).
    * Find Connections: Find new users to connect with.
    * See my account information: View your profile details
    * Analytics: View current statistics from the application
    * Return to log-in screen: Return to log-in screen and log out

With this functionality you should be able to use the app to add artists, create connections and matches, and hopefully find love.


## License & Information for Contributors

TBD



