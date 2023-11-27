class CreateIndicatorsLists < ActiveRecord::Migration[7.1]
  def change
    create_table :indicators_lists do |t|
      t.string :name
      t.string :precision

      t.timestamps
    end
  end
end
