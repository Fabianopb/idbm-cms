class AddAuthColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :login_count, :integer, :null => false, :default => 0
  	add_column :users, :perishable_token, :string
  	rename_column :users, :e_mail, :email
  end
end
