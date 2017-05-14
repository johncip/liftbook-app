class CreateNicknames < ActiveRecord::Migration[5.1]
  def change
    create_table :nicknames do |t|
      t.references :lift, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
