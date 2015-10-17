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
end
