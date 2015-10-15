class Vehicle < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip_service_tier
end
