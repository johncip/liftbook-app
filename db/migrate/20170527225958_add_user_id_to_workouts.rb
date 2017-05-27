class AddUserIdToWorkouts < ActiveRecord::Migration[5.1]
  def change
    add_reference :workouts, :user, index: true
    add_foreign_key :workouts, :users
  end
end
