class User < ActiveRecord::Base
    
    has_one :account
    has_and_belongs_to_many :travel_plans
    has_many :refund_claims
    has_many :comments
    
    scope :sorted, lambda { order("users.role ASC", "users.first_name ASC") }
    
    def name
        "#{first_name} #{last_name}"
    end
    
end
