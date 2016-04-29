class RefundClaim < ActiveRecord::Base
    belongs_to :user
    has_many :receipts
    has_many :daily_allowances
    has_many :km_allowances
    has_many :comments, as: :commentable
    
    scope :newest_first, lambda { order("refund_claims.created_at DESC") }
end
