class AddAuthColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :login_count, :integer, :null => false, :default => 0
  	add_column :users, :perishable_token, :string
  	rename_column :users, :e_mail, :email
  	change_column :users, :birth_date, :date, :default => '1900-01-01'
  end
end
