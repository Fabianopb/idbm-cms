class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.string  :social_security
      t.string  :phone_number
      t.string  :iban
      t.string  :swift
      t.string  :address
      t.string  :postal_code
      t.string  :city
      t.string  :project
      t.timestamps null: false
    end
    add_index :accounts, :user_id
  end
end
