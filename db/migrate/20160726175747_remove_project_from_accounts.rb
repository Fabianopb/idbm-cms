class RemoveProjectFromAccounts < ActiveRecord::Migration
  def change
  	remove_column :accounts, :project, :string
  end
end
