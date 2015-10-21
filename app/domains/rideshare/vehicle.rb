module Rideshare
  class Vehicle < ActiveRecord::Base
    belongs_to :user
    belongs_to :vehicle_type
  end
end
