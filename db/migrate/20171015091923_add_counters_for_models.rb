class AddCountersForModels < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :count_of_messages, :integer, null: false, default: 0
    add_column :messages, :count_of_votes, :integer, null: false, default: 0
  end
end
