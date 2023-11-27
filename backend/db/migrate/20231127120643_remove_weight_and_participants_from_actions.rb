class RemoveWeightAndParticipantsFromActions < ActiveRecord::Migration[7.1]
  def change
    remove_column :actions, :weight, :decimal
    remove_column :actions, :participants, :integer
  end
end
