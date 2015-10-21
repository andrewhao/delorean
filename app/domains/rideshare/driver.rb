class Driver < SimpleDelegator
  def self.find_by_user_id(user_id)
    new(User.find_by(is_driver: true, id: user_id))
  end

  def passengers_near_me; end
end
