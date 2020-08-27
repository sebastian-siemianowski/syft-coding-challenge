require 'rails_helper'

RSpec.describe Checkout do
  let(:lavender_heart_item){ "001" }
  let(:personalised_cufflinks){ "002"}
  let(:t_shirts_item){ "003"}
  let(:promotional_rules){[PromotionalRules::LavenderHearts, PromotionalRules::Over60]}

  context 'when testing scenario 1' do
    # Basket: 001,002,003
    # Total price expected: £66.78

    it 'returns correct price' do
      co = Checkout.new(promotional_rules)
      co.scan(lavender_heart_item) # item 001
      co.scan(personalised_cufflinks) # item 002
      co.scan(t_shirts_item) # item 003
      price = co.total

      expect(price).to eq "£66.78"
    end
  end

  context 'when testing scenario 2' do
    # Basket: 001,003,001
    # Total price expected: £36.95

    it 'returns correct price' do
      co = Checkout.new(promotional_rules)
      co.scan(lavender_heart_item) # item 001
      co.scan(lavender_heart_item) # item 001
      co.scan(t_shirts_item) # item 003
      price = co.total

      expect(price).to eq "£36.95"
    end
  end

  context 'when testing scenario 3' do
    # Basket: 001,002,001,003
    # Total price expected: £73.76

    xit 'returns correct price' do
      co = Checkout.new(promotional_rules)
      co.scan(lavender_heart_item) # item 001
      co.scan(personalised_cufflinks) # item 002
      co.scan(lavender_heart_item) # item 001
      co.scan(t_shirts_item) # item 003
      price = co.total

      expect(price).to eq "£73.76"
    end
  end
end