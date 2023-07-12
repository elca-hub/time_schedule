class ChangeDataTypeTagsDescription < ActiveRecord::Migration[7.0]
  def change
    change_column :tags, :description, :text
    change_column_null :tags, :description, true
  end
end
