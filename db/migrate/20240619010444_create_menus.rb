class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.references :user, null: false, foreign_key: true
      t.references :dish1, foreign_key: true
      t.references :dish2, foreign_key: true
      t.references :dish3, foreign_key: true
      t.datetime :start_time
      t.timestamps
    end
  end
end
