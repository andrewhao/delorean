class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
  belongs_to :order
end
