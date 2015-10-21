class Passenger < SimpleDelegator
  def self.find_by_user_id(user_id)
    new(User.find_by(is_driver: false, id: user_id))
  end

  def request_trip; end
end
