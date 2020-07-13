class User < ActiveRecord::Base
    has_many :connections, foreign_key: "connector_id"
    has_many :connectees, through: :connections, foreign_key: "connectee_id"
    has_many :rejections, foreign_key: "rejector_id"
    has_many :rejectees, through: :rejections
    has_many :user_artists
    has_many :artists, through: :user_artists

    #This method will tell your matches
    def matches
        connectees.select do |element|
            Connection.match?(self,element)
        end
    end
    # def matches
    # end

    def self.email_exist?(email)
        if self.all.find_by(email: email)
            true
        end
    end

        

    def self.verify_user(name,age,city,email)
        check= self.email_exist?(email)
        if check
            check
        else
            User.create(name: name, age: age, city: city, email: email)

        end
    end


    def connectee?(prospect)   
        Connection.all.any? do |element|
            element.connector == self && element.connectee == prospect
        end
    end

    def rejectee?(prospect)
        Rejection.all.any? do |element|
            element.rejector == self && element.rejectee == prospect
        end
    end

    def self.email_exist?(email)
        if self.all.find_by(email: email)
            true
        end
    end
     

    def self.verify_user(name,age,city,email)
        check= self.email_exist?(email)
        if check
            check
        else
            User.create(name: name, age: age, city: city, email: email)
        end
    end

    def genres
        var = self.artists.map { |artist| artist.genres}.flatten
        var.sort_by{|genre| var.count(genre)}.reverse
  
    end
    
    def genres_names
        genres.map{|genre| genre.name}.uniq
    end

    def self.well_connected
        most_connects = self.all.map {|u| u.connections.count}
        
         most_u = self.all.select do |u|
            u.connections.count == most_connects.max
        end
        puts "\nOur biggest flirt(s) are currently #{most_u.map{|u| u.name}.join(", ")} with an impressive #{most_u.map{|u| u.connections.count}.uniq[0]} connections. Go get'em tiger(s).\n"
    end


    def self.average_connections
        average = self.all.map {|u| u.connections.count}
        puts "The average user has #{average.sum(0.0)/average.count} connection(s)."
    end


 end
 