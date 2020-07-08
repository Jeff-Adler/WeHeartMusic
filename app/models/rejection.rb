class Rejection < ActiveRecord::Base
    belongs_to :rejector, class_name: :User
    belongs_to :rejectee, class_name: :User
end

        