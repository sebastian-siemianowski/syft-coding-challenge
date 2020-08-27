# frozen_string_literal: true

class Checkout
  attr_accessor :promotional_rules, :items

  def initialize(promotional_rules = [])
    @promotional_rules = promotional_rules
    @items             = []
  end

  def scan(item_code)
    item = Item.find_by_product_code(item_code)
    checkout_item = CheckoutItem.new(item)
    items.append(checkout_item)
  end

  def original_items_total
    return 0 if items.empty?

    price_array = items.map { |item| item.promotional_price || item.price }
    price_array.reduce(:+)
  end

  def total
    basket = Basket.new(items, original_items_total)

    promotional_rules.each do |rule|
      rule.new(basket).apply
    end

    basket.basket_total.round.format
  end
end
