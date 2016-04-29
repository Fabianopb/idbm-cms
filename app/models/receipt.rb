class Receipt < ActiveRecord::Base
    belongs_to :refund_claim
    
    scope :newest_first, lambda { order("receipts.created_at DESC") }
end
