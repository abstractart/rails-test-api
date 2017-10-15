class AddConstraintsForModels < ActiveRecord::Migration[5.1]
  def change
    change_column_null :votes, :user_id, false
    change_column_null :votes, :message_id, false
    change_column_null :messages, :user_id, false
  end
end
