class ChangeActionIdInIndicators < ActiveRecord::Migration[7.1]
  def change
    change_column_null :indicators, :action_id, false
  end
end
