class TravelPlan < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_and_belongs_to_many :transports
    has_many :comments, as: :commentable
    
    scope :newest_first, lambda { order("travel_plans.created_at DESC") }
    
    def travellers
        self.users.pluck(:first_name).join('; ')
    end
end
