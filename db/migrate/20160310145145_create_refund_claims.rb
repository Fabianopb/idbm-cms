class CreateRefundClaims < ActiveRecord::Migration
  def change
    create_table :refund_claims do |t|
      t.integer :user_id
      t.string :description
      t.string :status
      t.timestamps null: false
    end
    add_index :refund_claims, :user_id
  end
end
