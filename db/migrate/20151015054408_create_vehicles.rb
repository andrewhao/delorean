class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.float :gigawatt_output_rating
      t.references :user, index: true, foreign_key: true
      t.references :trip_service_tier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
