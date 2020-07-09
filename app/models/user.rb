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

end

