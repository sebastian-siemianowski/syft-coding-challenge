# frozen_string_literal: true

class Item < ApplicationRecord
  validates_presence_of :price_cents, :name, :product_code
  validates_uniqueness_of(:product_code, :name)
  validates_numericality_of :price_cents

  monetize :price_cents
end
