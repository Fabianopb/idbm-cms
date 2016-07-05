class TravelPlan < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_and_belongs_to_many :transports
    has_many :comments, as: :commentable
    
    scope :newest_first, lambda { order("travel_plans.created_at DESC") }
    
    def travellers
        self.users.pluck(:first_name).join('; ')
    end
    
    def total_allowance
        paid_days * daily_allowance
    end
    
    def total_costs
        tickets_cost + total_allowance + accommodation_costs + events_costs + other_costs
    end
end
