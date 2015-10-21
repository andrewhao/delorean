module Rideshare
  class TripPool < ActiveRecord::Base
    has_many :trips, through: :trip_pool_trips
    has_many :trip_pool_trips
  end
end
