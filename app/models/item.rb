class Item < ApplicationRecord
  validates_presence_of :price_cents, :name, :product_code
end
