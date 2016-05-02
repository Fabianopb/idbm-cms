class AddsPersistenceTokenToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :password_digest, :crypted_password
    add_column :users, :password_salt, :string, after: :crypted_password
    add_column :users, :persistence_token, :string
    add_index :users, :username, unique: true
  end
end
