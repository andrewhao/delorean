class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates_uniqueness_of :email
  has_many :orders
  belongs_to :service_tier
  has_one :vehicle
  has_many :payments

  def driver?
    is_driver?
  end

  def request_trip(passenger_origin_date, tier)
    Trip.create(origin_date: passenger_origin_date, passenger: self, service_tier: tier)
  end
end
