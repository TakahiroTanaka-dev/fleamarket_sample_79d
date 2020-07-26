class AddCategoryToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :category, foreign_key: true, null: false
  end
end
