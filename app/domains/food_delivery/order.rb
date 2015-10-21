module FoodDelivery
  class Order < ActiveRecord::Base
    belongs_to :user
    has_many :order_menu_items
    has_many :menu_items, through: :order_menu_items

    def total_cost
      item_cost + tax_cost
    end

    def item_cost
      menu_items.sum(&:cost)
    end

    def tax_cost
      menu_items.sum(&:tax_amount)
    end

    def add_item!(menu_item)
      menu_items << menu_item
    end

    def remove_item!(menu_item)
      menu_items.delete(menu_item)
      save
    end
  end
end
