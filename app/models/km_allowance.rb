class KmAllowance < ActiveRecord::Base
    belongs_to :refund_claim
    
    scope :sort_by_date, lambda { order("km_allowances.date DESC") }
end
