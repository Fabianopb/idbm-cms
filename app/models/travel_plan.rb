class TravelPlan < ActiveRecord::Base
    
    has_and_belongs_to_many :users
    has_and_belongs_to_many :transports
    has_many :comments, as: :commentable
    
    
    validates :destination,         :presence => true
    # validates :departure_date,      :presence => true
    # validates :return_date,         :presence => true
    validates :trip_description,    :presence => true


    scope :newest_first, lambda { order("travel_plans.created_at DESC") }

    
    def travellers
        (self.users.pluck(:first_name, :last_name).map {|user| user.join(' ')}).join(', ')
    end
    
    def total_allowance
        paid_days * daily_allowance
    end
    
    def total_costs
        tickets_cost + total_allowance + accommodation_costs + events_costs + other_costs
    end
    
end
