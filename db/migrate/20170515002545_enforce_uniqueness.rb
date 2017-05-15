class EnforceUniqueness < ActiveRecord::Migration[5.1]
  def change
    execute <<-SQL
      CREATE UNIQUE INDEX users_lower_email_idx ON users (LOWER(email));
      CREATE UNIQUE INDEX lifts_lower_name_idx ON lifts (LOWER(name));
      CREATE UNIQUE INDEX nicknames_lower_name_idx ON nicknames (LOWER(name));
    SQL
  end
end
