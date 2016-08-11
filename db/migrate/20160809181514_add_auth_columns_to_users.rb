class AddAuthColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :login_count, :integer, :null => false, :default => 0
  	add_column :users, :perishable_token, :string
  	rename_column :users, :e_mail, :email
  	remove_column :users, :birth_date, :date
  	add_column :accounts, :birth_date, :date
  	change_column :users, :role, :string, :default => 'Student'
  end
end
