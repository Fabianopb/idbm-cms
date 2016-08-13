class AddRefundClaimTotal < ActiveRecord::Migration
  def change
  	add_column :refund_claims, :refundable, :decimal, :default => 0
  	add_column :refund_claims, :posting, :boolean, :default => false
  end
end
