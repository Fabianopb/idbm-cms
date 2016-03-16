class CreateKmAllowances < ActiveRecord::Migration
  def change
    create_table :km_allowances do |t|
      t.integer :refund_claim_id
      t.date    :date
      t.string  :route
      t.decimal :kms
      t.string  :description
      t.timestamps null: false
    end
    add_index :km_allowances, :refund_claim_id
  end
end
