class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.integer :purchase_price
      t.integer :product_quantity
      t.string :purchase_company, :limit => 128
      t.datetime :order_date
      t.datetime :purchase_date
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
