require_relative '../config/environment'

refresh_database

seed

    #welcome

    #me = new_user

puts "Now let's build your playlist!"

me = User.create(name: "u1", age: 20, city: "Brick City", email: "u1@gmail.com")
UserArtist.create(user: me, artist: Artist.all[0])   


#this will run as many times as necessary to fill their playlist
    3.times do
        choose_artist(me)
    end

puts "Now let's find people with similar music choices to you!"

prospect = find_prospects(me)

connect_or_reject(me, prospect)

#This will allow them to continue finding to prospects to accept or reject
puts "Want to find more prospects? (y/n)"
response = gets.chomp.to_s
while response == "y" do
    prospect = find_prospects(me)

    connect_or_reject(me, prospect)
    
    puts "Want to find more prospects? (y/n)"
    response = gets.chomp.to_s
end

matches(me)





