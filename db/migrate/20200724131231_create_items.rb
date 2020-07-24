class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :introduction, null: false
      t.integer :condition, null: false, default: 0
      t.integer :price, null: false
      t.boolean :shipping_cost, null: false
      t.integer :prefecture_id, null: false
      t.string :shipping_day, null: false
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.references :buyer, foreign_key: { to_table: :users }
      t.string :size
      t.timestamps
    end
  end
end
