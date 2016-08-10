class User < ActiveRecord::Base
  
  has_one :account
  
  has_and_belongs_to_many :travel_plans
  has_many :refund_claims, :dependent => :destroy
  
  has_many :receipts
  has_many :daily_allowances
  has_many :km_allowances
  
  has_many :comments

  has_and_belongs_to_many :projects

  USERNAME_REGEX = /[a-zA-Z0-9_\.@]/

  before_validation :set_username, on: :create
  before_validation :set_password, on: :create

  validates :first_name,
            :last_name,
            :role,
            presence: true
  
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, :format => USERNAME_REGEX

  attr_accessor :enable_strict_validation
  validate :presence_of_passwords, :if => :enable_strict_validation

  def set_username
    self.username = "#{self.email}"
  end

  def set_password
    o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
    self.password = (0...8).map { o[rand(o.length)] }.join
    self.password_confirmation = self.password
  end

  def presence_of_passwords
    errors.add(:password, "can't be blank") if password.nil?
  end


  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end
  

  scope :sorted, -> { order("users.role ASC", "users.first_name ASC") }
  scope :all_except, ->(user) { where(["id != ?", user.id]) }
  

  def name
    "#{first_name} #{last_name}"
  end
  
  def admin?
    self.role == "Admin" ? true : false
  end

  def project
    self.projects.pluck(:project_name).join
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    ApplicationMailer.reset_email(self).deliver_now
  end
  
end
