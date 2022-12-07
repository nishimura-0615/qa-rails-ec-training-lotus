class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.string :product_name, limit: 64
      t.references :category, null: false, foreign_key: true
      t.integer :price, null: false
      t.string :description
      t.references :sale_status, null: false, foreign_key: true
      t.references :product_status, null: false, foreign_key: true
      t.datetime :resist_date, null: false
      t.boolean :delete_flag, default: false, null: false
      t.timestamps
    end
  end
end
