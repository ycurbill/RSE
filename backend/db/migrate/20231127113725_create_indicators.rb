class CreateIndicators < ActiveRecord::Migration[7.1]
  def change
    create_table :indicators do |t|
      t.string :name
      t.string :precision
      t.string :value
      t.references :action, foreign_key: true

      t.timestamps
    end
  end
end
