class AddWeightToEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :weight, :decimal, precision: 100, scale: 6
    add_column :entries, :units, :string
  end
end
