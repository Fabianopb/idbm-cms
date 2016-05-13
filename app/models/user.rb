class User < ActiveRecord::Base
    
    has_one :account
    has_and_belongs_to_many :travel_plans
    has_many :refund_claims
    has_many :comments
    
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
    
end
