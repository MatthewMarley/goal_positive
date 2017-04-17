class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.string :goal_type
      t.string :goal_name
      t.integer :start
      t.integer :current
      t.integer :end_goal
      t.timestamps
    end
  end
end
