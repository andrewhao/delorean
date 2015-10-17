class AddVehicleTypeIdToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :vehicle_type_id, :integer
  end
end
