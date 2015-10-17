class AddForeignKeysToTripPoolTrips < ActiveRecord::Migration
  def change
    add_column :trip_pool_trips, :trip_pool_id, :integer, null: false
    add_column :trip_pool_trips, :trip_id, :integer, null: false
  end
end
