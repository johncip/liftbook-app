class AddMoreNullConstraints < ActiveRecord::Migration[5.1]
  def change
    change_column_null :entries, :lift_id, false
    change_column_null :entries, :workout_id, false
    change_column_null :lifts, :user_id, false
    change_column_null :nicknames, :lift_id, false
    change_column_null :workouts, :user_id, false
  end
end
