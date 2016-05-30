class KmAllowance < ActiveRecord::Base
    belongs_to :refund_claim
    belongs_to :user
    
    scope :sort_by_date, lambda { order("km_allowances.date DESC") }
end
