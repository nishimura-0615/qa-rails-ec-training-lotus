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

user = User.create!(
  [
    {
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
      user_classification_id: '1',
      company_name: 'サンプル株式会社',
      delete_flag: true
    },
    {
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
      user_classification_id: '1',
      company_name: 'サンプル株式会社',
      delete_flag: true
    }
  ]
)
category = Category.create!(
  [
    { category_name: 'トップス' },
    { category_name: 'アウター' },
    { category_name: 'パンツ' },
    { category_name: 'シューズ' }
  ]
)

sale_status = SaleStatus.create!(
  [
    { sale_status: '定価' },
    { sale_status: 'セール' }
  ]
)

product_status = ProductStatus.create!(
  [
    { product_status_name: '新品' },
    { product_status_name: '中古' }
  ]
)

product = Product.create!(
  [
    {
      product_name: 'ニット',
      category_id: '1',
      price: '15000',
      description: '素材:綿50%,ウール50%, サイズ:M',
      sale_status_id: '1',
      product_status_id: '1',
      regist_date: '2022/10/20',
      user_id: '1',
      delete_flag: 0
    },
    {
      product_name: 'スニーカー',
      category_id: '4',
      price: '20000',
      description: '素材:キャンパス, サイズ:27.0cm',
      sale_status_id: '1',
      product_status_id: '1',
      regist_date: '2022/10/20',
      user_id: '2',
      delete_flag: 0
    }
  ]
)

Purchase.create!(
  [
    {
      purchase_price: '10000',
      purchase_quantity: '2',
      purchase_company: 'hoge株式会社',
      order_date: '2022/11/20',
      purchase_date: '2022/11/25',
      product_id: '1'
    },
    {
      purchase_price: '15000',
      purchase_quantity: '1',
      purchase_company: 'foo株式会社',
      order_date: '2022/11/22',
      purchase_date: '2022/11/27',
      product_id: '2'
    }
  ]
)
