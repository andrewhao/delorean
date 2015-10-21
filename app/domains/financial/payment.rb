module Financial
  class Payment < ActiveRecord::Base
    belongs_to :invoice
    belongs_to :order

    validates :invoice, presence: true
  end
end
