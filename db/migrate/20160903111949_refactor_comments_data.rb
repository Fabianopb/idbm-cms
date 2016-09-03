class RefactorCommentsData < ActiveRecord::Migration
  def change
  	add_column :refund_claims, :comment, :text
  end
end
