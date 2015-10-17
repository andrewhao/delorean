class CreateServiceTiers < ActiveRecord::Migration
  def change
    create_table :service_tiers do |t|
      t.float :rate
      t.boolean :is_eligible_for_trip_pooling, default: false
      t.references :vehicle_type

      t.timestamps null: false
    end
  end
end
