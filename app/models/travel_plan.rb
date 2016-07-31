class TravelPlan < ActiveRecord::Base
    
  has_and_belongs_to_many :users
  has_and_belongs_to_many :transports
  has_many :comments, as: :commentable
  

  scope :newest_first, lambda { order("travel_plans.created_at DESC") }

  
  validates :destination,
            :departure_date,
            :return_date,
            :trip_description,
            :tickets_description,
            :tickets_cost,
            :paid_days,
            :daily_allowance,
            :accommodation_costs,
            :events_costs,
            :other_costs,
            presence: true
  
  # custom validations
  validate :trip_dates
  validate :transport_types
  validate :allowances
  validate :payer
  validate :team_members

  def trip_dates
    errors.add(:departure_date, "can't be in the past") if departure_date < Date.today
    errors.add(:return_date, "can't be in the past") if return_date < Date.today
    errors.add(:return_date, "can't be before departure date") if return_date <= departure_date
  end

  def transport_types
    errors.add(:transport_ids, "Transports can't be empty") if transport_ids.empty?
  end

  def allowances
    errors.add(:paid_days, "can't be zero if you have daily allowance") if paid_days == 0 && daily_allowance > 0
    errors.add(:daily_allowance, "can't be zero if you have allowance days") if daily_allowance == 0 && paid_days > 0
  end

  def payer
    errors.add(:accommodation_aalto_paid, "Please mark a payer for the accommodation") if accommodation_aalto_paid.nil? && accommodation_costs > 0
    errors.add(:events_aalto_paid, "Please mark a payer for the event(s)") if events_aalto_paid.nil? && events_costs > 0

    errors.add(:accommodation_aalto_paid, "Please uncheck the accommodation payer if accommodation cost is zero") if !accommodation_aalto_paid.nil? && accommodation_costs == 0
    errors.add(:events_aalto_paid, "Please uncheck the events payer if events cost is zero") if !events_aalto_paid.nil? && events_costs == 0
  end

  def team_members
    errors.add(:user_ids, "You must choose at least one team member") if user_ids.empty?
  end


  # Helper methods

  def travellers
    (self.users.pluck(:first_name, :last_name).map {|user| user.join(' ')}).join(', ')
  end
  
  def total_allowance
    paid_days * daily_allowance
  end
  
  def total_costs
    tickets_cost + total_allowance + accommodation_costs + events_costs + other_costs
  end
    
end
