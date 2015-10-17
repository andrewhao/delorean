class RemoveServiceTierIdFromVehicles < ActiveRecord::Migration
  def change
    remove_column :vehicles, :service_tier_id
  end
end
