class AddsColumnsToItemTable < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.column :product_code, :string, null: false
      t.column :name, :string, null: false
      t.column :price_cents, :integer, null: false
      t.timestamps
    end
  end
end
