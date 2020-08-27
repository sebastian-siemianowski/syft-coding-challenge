# frozen_string_literal: true

class Basket
  attr_accessor :items, :basket_total

  def initialize(items, basket_total)
    @items = items
    @basket_total = basket_total
  end

  def count_product_items_by_code(code)
    return 0 if items.blank?

    items.select { |item| item.product_code == code }.count
  end

  def extract_items_by_code(code)
    extracted_items = items.select { |item| item.product_code == code }
    items.reject! { |item| item.product_code == code }
    extracted_items
  end
end
