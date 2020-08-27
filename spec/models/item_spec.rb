require 'rails_helper'

RSpec.describe Item, type: :model do
  it { is_expected.to validate_presence_of(:product_code) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:price_cents) }
  it { is_expected.to validate_numericality_of(:price_cents) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_uniqueness_of(:product_code).case_insensitive }

  context 'when testing items stored in db' do
    context 'when testing Lavender heart' do
      subject(:selected_item){ Item.find_by(product_code: '001') }

      let(:expected_product_code){ '001' }
      let(:expected_name){ 'Lavender heart' }
      let(:expected_price){ '9.25' }

      it { is_expected.to monetize(:price).with_currency(:gbp) }

      it 'expects correct product code to be present' do
        expect(selected_item.product_code).to eq(expected_product_code)
      end

      it 'it expects correct price to be present' do
        expect(selected_item.price.to_s).to eq(expected_price)
      end

      it 'expects correct name to be present' do
        expect(selected_item.name).to eq(expected_name)
      end
    end
    context 'when testing Personalised cufflinks' do
      subject(:selected_item){ Item.find_by(product_code: '002') }

      let(:expected_product_code){ '002' }
      let(:expected_name){ 'Personalised cufflinks' }
      let(:expected_price){ '45.00' }

      it { is_expected.to monetize(:price).with_currency(:gbp) }

      it 'expects correct product code to be present' do
        expect(selected_item.product_code).to eq(expected_product_code)
      end

      it 'it expects correct price to be present' do
        expect(selected_item.price.to_s).to eq(expected_price)
      end

      it 'expects correct name to be present' do
        expect(selected_item.name).to eq(expected_name)
      end
    end

    context 'when testing Kids T-shirt' do
      subject(:selected_item){ Item.find_by(product_code: '003') }

      let(:expected_product_code){ '003' }
      let(:expected_name){ 'Kids T-shirt' }
      let(:expected_price){ '19.95' }

      it { is_expected.to monetize(:price).with_currency(:gbp) }

      it 'expects correct product code to be present' do
        expect(selected_item.product_code).to eq(expected_product_code)
      end

      it 'it expects correct price to be present' do
        expect(selected_item.price.to_s).to eq(expected_price)
      end

      it 'expects correct name to be present' do
        expect(selected_item.name).to eq(expected_name)
      end
    end
  end
end
