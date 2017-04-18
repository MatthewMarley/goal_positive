class AddDateFieldsToGoals < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :start_date, :date_field
    add_column :goals, :current_date, :date_field
    add_column :goals, :end_date, :date_field
  end
end
