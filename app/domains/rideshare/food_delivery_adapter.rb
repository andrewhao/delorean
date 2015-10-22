module Rideshare
  class FoodDeliveryAdapter
    def order_from_trip(trip)
      FoodDelivery::Order.find_by(trip_id: trip.id)
    end
  end
end
