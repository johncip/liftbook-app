class RemoveUniqueWorkoutDateContraint < ActiveRecord::Migration[5.1]
  def change
    remove_index :workouts, :date
    add_index :workouts, :date, unique: false
  end
end
