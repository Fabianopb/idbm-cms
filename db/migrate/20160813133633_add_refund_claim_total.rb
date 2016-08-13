class AddRefundClaimTotal < ActiveRecord::Migration
  def change
  	add_column :refund_claims, :refundable, :decimal, :default => 0
  end
end
