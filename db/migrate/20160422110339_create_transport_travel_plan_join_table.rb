class CreateTransportTravelPlanJoinTable < ActiveRecord::Migration
  def change
    create_table :transports_travel_plans do |t|
      t.integer :transport_id
      t.integer :travel_plan_id
    end
    add_index :transports_travel_plans, :transport_id
    add_index :transports_travel_plans, :travel_plan_id
  end
end
