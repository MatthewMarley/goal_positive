class AddPlanToUser < ActiveRecord::Migration[5.0]
  def change
    # Add a column to the users table, called plan_id, and have it be in integer format
    add_column :users, :plan_id, :integer
  end
end
