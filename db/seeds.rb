# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user_classification = UserClassification.create!(
  user_classification_name: '種別名'
)

user_1 = User.create!(
  password: 'password',
  last_name: '太郎',
  first_name: '佐藤',
  zipcode: '870-1234',
  prefecture: '大分県',
  municipality: '別府市',
  address: '1番地',
  apartments: 'hoge101',
  email: 'test1@test.com',
  phone_number: '09012345678',
  user_classification_id: user_classification.id,
  company_name: 'サンプル株式会社',
  delete_flag: false
)
user_2 = User.create!(
  password: 'password',
  last_name: '二郎',
  first_name: '佐藤',
  zipcode: '870-5678',
  prefecture: '大分県',
  municipality: '大分市',
  address: '2番地',
  apartments: 'hoge202',
  email: 'test2@test.com',
  phone_number: '09098765432',
  user_classification_id: user_classification.id,
  company_name: 'サンプル株式会社',
  delete_flag: false
)

category_1 = Category.create!( category_name: 'トップス' )
category_2 = Category.create!( category_name: 'アウター' )
category_3 = Category.create!( category_name: 'パンツ' )
category_4 = Category.create!( category_name: 'シューズ' )

sale_status_1 = SaleStatus.create!( sale_status_name: '定価' )
sale_status_2 = SaleStatus.create!( sale_status_name: 'セール' )

product_status_1 = ProductStatus.create!( product_status_name: '新品' )
product_status_2 = ProductStatus.create!( product_status_name: '中古' )

product_1 = Product.create!(
  product_name: 'ニット',
  category_id: category_1.id,
  price: 15000,
  description: '素材:綿50%,ウール50%, サイズ:M',
  sale_status_id: sale_status_1.id,
  product_status_id: product_status_1.id,
  regist_date: Time.new(2022, 10, 21, 13, 30, 0, "+09:00"),
  user_id: user_1.id,
  delete_flag: false
)
product_2 = Product.create!(
  product_name: 'スニーカー',
  category_id: category_4.id,
  price: 20000,
  description: '素材:キャンパス, サイズ:27.0cm',
  sale_status_id: sale_status_1.id,
  product_status_id: product_status_1.id,
  regist_date: Time.new(2022, 10, 21, 14, 00, 0, "+09:00"),
  user_id: user_2.id,
  delete_flag: false
)

Purchase.create!(
  [
    {
      purchase_price: 10000,
      purchase_quantity: 2,
      purchase_company: 'hoge株式会社',
      order_date: Time.new(2022, 10, 21, 14, 00, 0, "+09:00"),
      purchase_date: Time.new(2022, 10, 25, 14, 00, 0, "+09:00"),
      product_id: product_1.id
    },
    {
      purchase_price: 15000,
      purchase_quantity: 1,
      purchase_company: 'foo株式会社',
      order_date: Time.new(2022, 10, 22, 14, 00, 0, "+09:00"),
      purchase_date: Time.new(2022, 10, 26, 14, 00, 0, "+09:00"),
      product_id: product_2.id
    }
  ]
)
