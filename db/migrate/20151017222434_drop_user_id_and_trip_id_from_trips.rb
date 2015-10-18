class DropUserIdAndTripIdFromTrips < ActiveRecord::Migration
  def change
    remove_column :payments, :user_id
    remove_column :payments, :trip_id
    add_column :payments, :invoice_id, :integer, null: false
  end
end
