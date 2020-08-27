# frozen_string_literal: true

module PromotionalRules
  class LavenderHearts
    attr_accessor :basket_total, :basket

    LAVENDER_HEARTS_CODE = '001'

    def initialize(basket)
      @basket = basket
      @basket_total = if basket.basket_total&.positive?
                        basket.basket_total
                      else
                        0
                      end
    end

    def apply
      if basket.count_product_items_by_code(LAVENDER_HEARTS_CODE) >= 2
        lavender_hearts_items = basket.extract_items_by_code(LAVENDER_HEARTS_CODE)
        updated_items = lavender_hearts_items.map do |item|
          item.promotional_price_cents = 850
          item.promotional_price = Money.new(item.promotional_price_cents, ENV['DEFAULT_CURRENCY'])
          item
        end

        basket.items = basket.items | updated_items

        price_array = basket.items.map { |item| item.promotional_price || item.price }
        new_price_total = price_array.reduce(:+)
        @basket_total = new_price_total
        basket.basket_total = @basket_total
      end

      basket
    end
  end
end
