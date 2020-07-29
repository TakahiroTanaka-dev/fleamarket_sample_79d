class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :condition, null: false, default: 0
      t.string :price, null: false
      t.integer :shipping_cost, null: false
      t.integer :prefecture_id, null: false
      t.integer :shipping_day, null: false
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.references :buyer, foreign_key: { to_table: :users }
      t.integer :size
      t.timestamps
    end
  end
end
