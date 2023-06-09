class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :user_id, null: false
      t.string :name, null: false
      t.string :color_code, null: false
      t.string :description, null: true, default: nil

      t.timestamps
    end
  end
end
