class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.integer :refund_claim_id
      t.date    :expense_date
      t.string  :description
      t.decimal :value
      t.string  :currency
      t.timestamps null: false
    end
    add_index :receipts, :refund_claim_id
  end
end
