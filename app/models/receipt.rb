class Receipt < ActiveRecord::Base
    
  belongs_to :refund_claim
  belongs_to :user
  
  scope :newest_first, lambda { order("receipts.created_at DESC") }

  validates :expense_date,
  					:description,
  					:value,
  					:currency,
  					presence: true

end
