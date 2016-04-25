class RemoveIdColumnFromJoinTables < ActiveRecord::Migration
  def change
    remove_column :travel_plans_users, :id
    remove_column :transports_travel_plans, :id
  end
end
