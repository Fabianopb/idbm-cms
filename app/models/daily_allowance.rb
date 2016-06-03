class DailyAllowance < ActiveRecord::Base
    belongs_to :refund_claim
    belongs_to :user
    
    scope :sort_by_arrival, lambda { order("daily_allowances.arrival ASC") }
end
