class CreateTripPools < ActiveRecord::Migration
  def change
    create_table :trip_pools do |t|

      t.timestamps null: false
    end
  end
end
