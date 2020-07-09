class Connection < ActiveRecord::Base
    belongs_to :connector, class_name: :User 
    belongs_to :connectee, class_name: :User 

    #this method returns true if UserA is connected with UserB, and vice versa. This establishes a 'match'
    def self.match?(user_a,user_b)
        (user_a.connectees.include? user_b) && (user_b.connectees.include? user_a)
    end
    #jeff , alice
    #alice, jeff

end

