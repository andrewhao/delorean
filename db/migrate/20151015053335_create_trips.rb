class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.datetime :origin_date
      t.datetime :destination_date
      t.boolean :is_in_progress, default: false

      t.timestamps null: false
    end
  end
end
