class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :message, foreign_key: true

      t.timestamps
    end

    add_index :votes, [:user_id, :message_id], unique: true
  end
end
