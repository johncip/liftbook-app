class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.references :lift, foreign_key: true
      t.integer :sets
      t.integer :reps
      t.text :notes

      t.timestamps
    end
  end
end
