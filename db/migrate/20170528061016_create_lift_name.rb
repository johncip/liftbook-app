class CreateLiftName < ActiveRecord::Migration[5.1]
  def change
    create_table :lift_names do |t|
      t.bigint 'lift_id', null: false
      t.string 'name', null: false
      t.boolean 'main', null: false, default: true
      t.timestamps

      t.index ['lift_id'], name: 'index_lift_names_on_lift_id'
      t.index 'lower((name)::text)', name: 'index_lift_names_on_lower_name_text', unique: true
      t.index [:lift_id], unique: true, where: 'main', name: 'index_main_lift_name_on_lift_id'
    end

    add_foreign_key 'lift_names', 'lifts'
  end
end
