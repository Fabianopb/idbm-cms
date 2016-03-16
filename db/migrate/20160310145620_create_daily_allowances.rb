class CreateDailyAllowances < ActiveRecord::Migration
  def change
    create_table :daily_allowances do |t|
      t.integer   :refund_claim_id
      t.datetime  :departure
      t.datetime  :arrival
      t.datetime  :return
      t.string    :destination
      t.timestamps null: false
    end
    add_index :daily_allowances, :refund_claim_id
  end
end
