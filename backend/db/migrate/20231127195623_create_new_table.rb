class CreateNewTable < ActiveRecord::Migration[7.1]
  def change
    create_table :new_tables do |t|
      t.string :name
      t.string :precision

      t.timestamps
    end
  end
end
