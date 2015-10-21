module Rideshare
  class Vehicle < ActiveRecord::Base
    belongs_to :user, class_name: Identity::User
    belongs_to :vehicle_type
  end
end
