class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.references :user, null: false, foreign_key: true
      t.string :date, null: false
      t.string :dish1
      t.string :dish2
      t.string :dish3
      t.timestamps
    end
  end
end
