class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :password
      t.string :last_name
      t.string :first_name
      t.string :zipcode
      t.string :prefecture
      t.string :municipality
      t.string :address
      t.string :apartments
      t.string :email
      t.string :phone_number
      t.string :AddUserClassNameToUsers
      t.references :user_classification, null: false, foreign_key: true
      t.string :company_name
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
