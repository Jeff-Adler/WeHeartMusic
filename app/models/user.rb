class User < ActiveRecord::Base
    has_many :connections, foreign_key: "connector_id"
    has_many :connectees, through: :connections
    has_many :rejections, foreign_key: "rejector_id"
    has_many :rejectees, through: :rejections
    has_many :user_artists
    has_many :artists, through: :user_artists

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

end

