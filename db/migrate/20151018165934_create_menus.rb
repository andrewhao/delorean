class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.datetime :start_date, null: false
      t.datetime :end_date
      t.string :name

      t.timestamps null: false
    end
  end
end
