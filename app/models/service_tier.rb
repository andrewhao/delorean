class ServiceTier < ActiveRecord::Base
  belongs_to :vehicle_type
  belongs_to :user

  def eligible_for_trip_pool?
    is_eligible_for_trip_pooling?
  end

  def billed_rate(is_trip_pool)
    if eligible_for_trip_pool? && is_trip_pool
      billed_rate / 2.0
    else
      billed_rate
    end
  end
end
