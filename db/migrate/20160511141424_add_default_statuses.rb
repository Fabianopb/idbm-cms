class AddDefaultStatuses < ActiveRecord::Migration
  def up
    change_column :travel_plans, :status, :string, :default => "not submitted"
    change_column :refund_claims, :status, :string, :default => "not submitted"
  end
  def down
    change_column :travel_plans, :status, :string
    change_column :refund_claims, :status, :string
  end
end
