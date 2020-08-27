class CheckoutItem
  attr_reader :price, :price_cents, :product_code, :item_name
  attr_accessor :promotional_price, :promotional_price_cents

  def initialize(item)
    @price_cents = item.price_cents
    @price = Money.new(@price_cents, ENV['DEFAULT_CURRENCY'])
    @product_code = item.product_code
    @item_name = item.name
  end
end