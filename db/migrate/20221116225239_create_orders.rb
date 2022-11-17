class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :order_date, null: false
      t.string :order_number, limit: 16, null: false

      t.timestamps
    end
  end
end
