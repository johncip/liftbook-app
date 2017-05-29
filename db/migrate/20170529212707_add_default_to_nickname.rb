class AddDefaultToNickname < ActiveRecord::Migration[5.1]
  def change
    change_column :lifts, :nickname, :string, null: false, default: 'new'
  end
end
