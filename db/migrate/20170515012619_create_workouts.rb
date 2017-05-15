class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.datetime :date, null: false
      t.text :notes

      t.timestamps
    end

    add_reference :entries, :workout, index: true
    add_foreign_key :entries, :workouts
  end
end
