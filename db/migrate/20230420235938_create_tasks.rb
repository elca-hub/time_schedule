class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :user_id, null: false, foreign_key: true
      t.string :tag_id, null: false
      t.string :title, null: false
      t.string :content
      t.boolean :is_done, null: false, default: false

      t.timestamps
    end
  end
end
