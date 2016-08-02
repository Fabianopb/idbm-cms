class User < ActiveRecord::Base
  
  has_one :account
  
  has_and_belongs_to_many :travel_plans
  has_many :refund_claims
  
  has_many :receipts
  has_many :daily_allowances
  has_many :km_allowances
  
  has_many :comments

  has_and_belongs_to_many :projects


  validates :first_name,
            :last_name,
            presence: true
  
  validates :username, presence: true, uniqueness: true

  validates :e_mail,
            :birth_date,
            :role,
            presence: true

  
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
  
end
