class EnforceUniqueness < ActiveRecord::Migration[5.1]
  def change
    add_index :lifts, 'lower((name)::text), user_id', unique: true
    add_index :nicknames, 'lower((name)::text)', unique: true
    add_index :users, 'lower((email)::text)', unique: true
  end
end
