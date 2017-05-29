class EnforceUniquenessOfWorkoutDate < ActiveRecord::Migration[5.1]
  def change
    add_index :workouts, :date, unique: true
  end
end
