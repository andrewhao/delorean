class AddServiceTierIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :service_tier, index: true, foreign_key: true
  end
end
