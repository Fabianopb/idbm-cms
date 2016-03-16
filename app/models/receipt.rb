class Receipt < ActiveRecord::Base
    belongs_to :refund_claim
end
