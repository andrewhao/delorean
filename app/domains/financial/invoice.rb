module Financial
  class Invoice < ActiveRecord::Base
    belongs_to :trip, class_name: Rideshare::Trip
    belongs_to :user, class_name: Identity::User
  end
end
