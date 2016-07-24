class AddIndexFromProjectsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :project_id, :string
  	add_index :users, :project_id
  end
end
