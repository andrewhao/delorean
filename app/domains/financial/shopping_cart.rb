module Financial
  class ShoppingCart
    def order
      @order ||= FoodDelivery::Order.new
    end

    def amount
      @order.total_cost
    end

    def add(item)
      order.add_item!(item)
    end

    def remove(item)
      order.remove_item!(item)
    end
  end
end
