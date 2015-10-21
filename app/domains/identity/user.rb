module Identity
  class User < ActiveRecord::Base
    has_secure_password
    validates :email, presence: true
    validates_uniqueness_of :email
    has_many :orders
    belongs_to :service_tier

    def driver?
      is_driver?
    end

    def request_trip(passenger_origin_date, tier)
      Trip.create(origin_date: passenger_origin_date, passenger: self, service_tier: tier)
    end

    def passengers_near_me(current_date)

    end
  end
end
