class IndexExpensesInClaims < ActiveRecord::Migration
  def change
    
    add_column :receipts, :user_id, :integer
    add_index :receipts, :user_id
    
    add_column :daily_allowances, :user_id, :integer
    add_index :daily_allowances, :user_id
    
    add_column :km_allowances, :user_id, :integer
    add_index :km_allowances, :user_id
  end
end
