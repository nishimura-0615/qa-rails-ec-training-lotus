class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.references :shipment_status, null: false, foreign_key: true
      t.string :order_detail_number, limit: 64, null: false
      t.integer :order_quantity, limit: 8, null: false
      t.datetime :shipment_date, null: false

      t.timestamps
    end
  end
end
