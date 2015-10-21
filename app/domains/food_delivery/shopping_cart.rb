module FoodDelivery
  class ShoppingCart
    attr_accessor :customer

    def initialize(customer)
      @customer = customer
    end

    def order
      @order ||= Order.new
    end

    def amount
      @order.menu_items.sum(&:cost) +
        @order.menu_items.sum(&:tax_amount)
    end

    def add(item)
      order.add_item!(item)
    end

    def remove(item)
      order.remove_item!(item)
    end
  end
end
