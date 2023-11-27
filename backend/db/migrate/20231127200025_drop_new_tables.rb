class DropNewTables < ActiveRecord::Migration[7.1]
  def change
    drop_table :new_tables
  end
end
