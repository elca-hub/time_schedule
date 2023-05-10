class CreateUsers < ActiveRecord::Migration[7.0]
    def change
      create_table :users do |t|
        t.string :name, null: false
        t.string :password_digest, null: false
        t.string :auth_token, null: true
        t.time :auth_token_expiration, null: true
        t.timestamps
      end
      add_index :users, [:name], unique: true
    end
  end
  