class User < ActiveRecord::Base
    has_one :account
    has_and_belongs_to_many :travel_plans
    has_many :refund_claims
    has_many :comments
end
