class AddNicknameToLift < ActiveRecord::Migration[5.1]
  def change
    # NOTE: default is added in AddDefaultToNickname migration
    add_column :lifts, :nickname, :string, null: false # rubocop:disable Rails/NotNullColumn
    add_index :lifts, 'lower((nickname)::text)', unique: true
  end
end
