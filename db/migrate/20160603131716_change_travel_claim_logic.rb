class ChangeTravelClaimLogic < ActiveRecord::Migration
  def change
    remove_column :daily_allowances, :departure, :datetime
    remove_column :daily_allowances, :return_date, :datetime
    
    add_column :refund_claims, :departure, :datetime
    add_column :refund_claims, :return_date, :datetime
  end
end
