class ChangeServiceTierDefault < ActiveRecord::Migration
  def change
    add_column :trips, :service_tier_id, :integer, null: false
  end
end
