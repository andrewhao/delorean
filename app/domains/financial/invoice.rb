module Financial
  class Invoice < ActiveRecord::Base
    belongs_to :trip
    belongs_to :user
  end
end
