class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.references :menu, index: true, foreign_key: true
      t.string :name
      t.integer :price

      t.timestamps null: false
    end
  end
end
