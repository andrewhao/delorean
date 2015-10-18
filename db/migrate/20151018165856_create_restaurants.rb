class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :name

      t.timestamps null: false
    end
  end
end
