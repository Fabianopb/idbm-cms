class AddDefaultsToDatabases < ActiveRecord::Migration
  def up
    change_column :travel_plans, :paid_days, :integer, :default => 0
    change_column :travel_plans, :daily_allowance, :decimal, :default => 0
    change_column :travel_plans, :accommodation_costs, :decimal, :default => 0
    change_column :travel_plans, :events_costs, :decimal, :default => 0
    change_column :travel_plans, :other_costs, :decimal, :default => 0
  end
  def down
    change_column :travel_plans, :paid_days, :integer
    change_column :travel_plans, :daily_allowance, :decimal
    change_column :travel_plans, :accommodation_costs, :decimal
    change_column :travel_plans, :events_costs, :decimal
    change_column :travel_plans, :other_costs, :decimal
  end
end
