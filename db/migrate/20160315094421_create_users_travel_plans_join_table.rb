class CreateUsersTravelPlansJoinTable < ActiveRecord::Migration
  def change
    create_table :users_travel_plans do |t|
      t.integer :user_id
      t.integer :travel_plan_id
    end
    add_index :users_travel_plans, :user_id
    add_index :users_travel_plans, :travel_plan_id
  end
end
