class CreateTripServiceTiers < ActiveRecord::Migration
  def change
    create_table :trip_service_tiers do |t|
      t.float :billed_rate
      t.boolean :is_eligible_for_trip_pooling

      t.timestamps null: false
    end
  end
end
