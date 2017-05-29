class AddOrderToEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :order, :integer, null: false, default: 0
  end
end
