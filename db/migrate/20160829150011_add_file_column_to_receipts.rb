class AddFileColumnToReceipts < ActiveRecord::Migration
  def change
  	add_column :receipts, :attachment, :string
  end
end
