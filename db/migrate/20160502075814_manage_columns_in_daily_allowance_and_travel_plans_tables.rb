class ManageColumnsInDailyAllowanceAndTravelPlansTables < ActiveRecord::Migration
  def change
    remove_column :travel_plans, :transport, :string
    rename_column :daily_allowances, :return, :return_date
  end
end
