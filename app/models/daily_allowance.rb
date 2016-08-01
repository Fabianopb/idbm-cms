class DailyAllowance < ActiveRecord::Base
  
  belongs_to :refund_claim
  belongs_to :user
  
  scope :sort_by_arrival, lambda { order("daily_allowances.arrival ASC") }

  validates :destination, 
  					:arrival,
  					presence: true

  validate :arrival_after_departure

  def arrival_after_departure
  	errors.add(:arrival, "must be after #{self.refund_claim.departure} and before #{self.refund_claim.return_date}") if arrival < self.refund_claim.departure || arrival > self.refund_claim.return_date
  end

end
