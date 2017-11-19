class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nickname, null: false, limit: 32
      t.string :password_digest, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
