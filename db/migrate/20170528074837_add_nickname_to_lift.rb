class AddNicknameToLift < ActiveRecord::Migration[5.1]
  def change
    add_column :lifts, :nickname, :string, null: false
    add_index :lifts, 'lower((nickname)::text)', unique: true
  end
end
