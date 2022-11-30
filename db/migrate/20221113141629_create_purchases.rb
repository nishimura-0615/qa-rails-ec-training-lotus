class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.integer :purchase_price, null: false
      t.integer :product_quantity, null: false
      t.string :purchase_company, null: false, :limit => 128
      t.datetime :order_date, null: false
      t.datetime :purchase_date
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
