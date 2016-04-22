class Transport < ActiveRecord::Base
    has_and_belongs_to_many :travel_plans
end
