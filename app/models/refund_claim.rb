class RefundClaim < ActiveRecord::Base
    
  belongs_to :user
  has_many :receipts
  has_many :daily_allowances
  has_many :km_allowances
  has_many :comments, as: :commentable
  
  scope :newest_first, lambda { order("refund_claims.created_at DESC") }

  validates :description, presence: true
  validate :trip_dates

  def trip_dates
  	unless departure.nil?
    	errors.add(:departure, "can't be in the future") if departure > DateTime.now
  	end
  	unless return_date.nil?
	    errors.add(:return_date, "can't be in the future") if return_date > DateTime.now
	    errors.add(:return_date, "can't be before departure date") if return_date <= departure
	  end
	  errors.add(:departure, "can't be blank if you have a return date") if departure.nil? && !return_date.nil?
	  errors.add(:return_date, "can't be blank if you have a departure date") if return_date.nil? && !departure.nil?
	end

end
