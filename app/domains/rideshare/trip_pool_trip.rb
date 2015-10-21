class TripPoolTrip < ActiveRecord::Base
  belongs_to :trip_pool
  belongs_to :trip
end
