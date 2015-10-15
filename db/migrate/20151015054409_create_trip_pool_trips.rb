class CreateTripPoolTrips < ActiveRecord::Migration
  def change
    create_table :trip_pool_trips do |t|

      t.timestamps null: false
    end
  end
end
