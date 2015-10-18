class AddOrderIdToTrips < ActiveRecord::Migration
  def change
    add_reference :trips, :order, index: true, foreign_key: true
  end
end
