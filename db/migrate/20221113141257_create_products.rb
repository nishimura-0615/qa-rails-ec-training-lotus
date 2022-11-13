class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name, :string_limit, :limit => 64
      t.references :category, null: false, foreign_key: true
      t.integer :price
      t.string :description
      t.references :sale_status, null: false, foreign_key: true
      t.references :product_status, null: false, foreign_key: true
      t.datetime :resist_date
      t.boolean :delete_flag
      t.timestamps
    end
  end
end
