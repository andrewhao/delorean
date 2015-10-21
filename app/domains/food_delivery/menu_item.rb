module FoodDelivery
  class MenuItem < ActiveRecord::Base
    belongs_to :menu
  end
end
