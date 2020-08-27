class AddsProductsToItemsTable < ActiveRecord::Migration[6.0]
  def up
    lavender_heart_item = Item.new(product_code: '001', name: 'Lavender heart', price_cents: 925)
    personalised_cufflinks = Item.new(product_code: '002', name: 'Personalised cufflinks', price_cents: 4500)
    t_shirts_item = Item.new(product_code: '003', name: 'Kids T-shirt', price_cents: 1995)

    lavender_heart_item.save!
    personalised_cufflinks.save!
    t_shirts_item.save!
  end

  def down
    Item.where(product_code: ['001','002','003']).destroy_all
  end
end
