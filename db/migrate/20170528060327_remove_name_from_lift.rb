class RemoveNameFromLift < ActiveRecord::Migration[5.1]
  def change
    remove_column :lifts, :name, :string

    # NOTE: reversing this migration will not restore the index:
    #
    # t.index "lower((name)::text), user_id",
    #         name: "index_lifts_on_lower_name_text_user_id",
    #         unique: true
  end
end
