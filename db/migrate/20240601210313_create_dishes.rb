class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :dish, null: false
      t.integer :category_id, null: false
      t.text :remark
      t.timestamps
    end
  end
end
