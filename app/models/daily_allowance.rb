class DailyAllowance < ActiveRecord::Base
    belongs_to :refund_claim
    
    scope :sort_by_arrival, lambda { order("daily_allowances.arrival DESC") }
end
