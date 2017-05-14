class AddNullConstraints < ActiveRecord::Migration[5.1]
  def change
    change_column_null :entries, :reps, false
    change_column_null :entries, :sets, false
    change_column_null :entries, :units, false
    change_column_null :entries, :weight, false

    change_column_null :lifts, :name, false

    change_column_null :nicknames, :name, false

    change_column_null :users, :email, false
    change_column_null :users, :name, false
  end
end
