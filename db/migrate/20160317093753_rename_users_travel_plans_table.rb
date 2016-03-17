class RenameUsersTravelPlansTable < ActiveRecord::Migration
  def change
    rename_table :users_travel_plans, :travel_plans_users
  end
end
