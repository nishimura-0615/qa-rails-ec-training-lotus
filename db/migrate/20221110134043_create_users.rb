class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :password, limit: 64, null: false
      t.string :last_name, limit: 16, null: false
      t.string :first_name, limit: 16, null: false
      t.string :zipcode, limit: 16, null: false
      t.string :prefecture, limit: 16, null: false
      t.string :municipality, limit: 16, null: false
      t.string :address, limit: 32, null: false
      t.string :apartments, limit: 32, null: false
      t.string :email, limit: 128, null: false
      t.string :phone_number, limit: 16, null: false
      t.references :user_classification, null: false, foreign_key: true
      t.string :company_name, limit: 128
      t.boolean :delete_flag, default: false, null: false

      t.timestamps
    end
  end
end
