class RefactorCommentsData < ActiveRecord::Migration
  def change
  	add_column :refund_claims, :comment, :text
  	add_column :travel_plans, :comment, :text
  end
end
