class RecreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :goal_id
      t.string :comment
    end
  end
end
