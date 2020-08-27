# frozen_string_literal: true

module PromotionalRules
  class Over60
    attr_accessor :basket_total, :basket

    def initialize(basket)
      @basket = basket
      @basket_total = if basket.basket_total&.positive?
                        basket.basket_total
                      else
                        0
                      end
    end

    def apply
      calculate_new_basket_total if basket_total.to_f >= 60

      basket
    end

    private

    def calculate_new_basket_total
      ten_percent_discount = basket_total * 0.1
      new_basket_total     = basket_total - ten_percent_discount

      basket.basket_total = if new_basket_total.positive?
                              new_basket_total
                            else
                              0
                            end
    end
  end
end
