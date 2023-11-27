class CreateActions < ActiveRecord::Migration[7.1]
  def change
    create_table :actions do |t|
      t.string :name
      t.string :description
      t.date :date
      t.string :partner
      t.decimal :weight
      t.integer :participants

      t.timestamps
    end
  end
end
