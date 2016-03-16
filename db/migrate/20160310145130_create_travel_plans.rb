class CreateTravelPlans < ActiveRecord::Migration
  def change
    create_table :travel_plans do |t|
      t.string  :destination
      t.date    :departure_date
      t.date    :return_date
      t.string  :trip_description
      t.string  :transport
      t.string  :tickets_description
      t.decimal :tickets_cost
      t.integer :paid_days
      t.decimal :daily_allowance
      t.decimal :accommodation_costs
      t.boolean :accommodation_aalto_paid
      t.decimal :events_costs
      t.boolean :events_aalto_paid
      t.string  :other_description
      t.decimal :other_costs
      t.string  :status
      t.timestamps null: false
    end
  end
end
