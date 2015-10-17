class CreateVehicleTypes < ActiveRecord::Migration
  def change
    create_table :vehicle_types do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :vehicle_types, :name
  end
end
