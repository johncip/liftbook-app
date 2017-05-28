class DropNicknames < ActiveRecord::Migration[5.1]
  def change
    drop_table :nicknames do |t|
      t.bigint 'lift_id', null: false
      t.string 'name', null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index 'lower((name)::text)', name: 'index_nicknames_on_lower_name_text', unique: true
      t.index ['lift_id'], name: 'index_nicknames_on_lift_id'
    end
  end
end
