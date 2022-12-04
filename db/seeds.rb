# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

general_user_classification = UserClassification.create!(user_classification_name: "一般ユーザー")
seller_user_classification = UserClassification.create!(user_classification_name: "販売者ユーザー")
5.times do |n|
  User.create!(
    [
      {
        email: "user#{n + 1}@example.com",
        password: "password1234",
        first_name: "user",
        last_name: "#{n + 1}",
        user_classification_id: general_user_classification.id,
        zipcode: "123-4567",
        prefecture: "東京都",
        municipality: "千代田区",
        address: "代々木1丁目31-1",
        apartments: "代々木ビル1F",
        phone_number: "%010d" % (n + 1),
        company_name: "株式会社 清水塾",
        delete_flag: false,
      },
      {
        email: "seller_user#{n + 1}@example.com",
        password: "password1234",
        first_name: "seller",
        last_name: "#{n + 1}",
        user_classification_id: seller_user_classification.id,
        zipcode: "123-4567",
        prefecture: "東京都",
        municipality: "千代田区",
        address: "代々木2丁目5-1",
        apartments: "代々木ビル1F",
        phone_number: "%011d" % (n + 1),
        company_name: "株式会社 清水塾",
        delete_flag: false,
      },
    ],
  )
end

category_1 = Category.create!(category_name: "トップス")
category_2 = Category.create!(category_name: "アウター")
category_3 = Category.create!(category_name: "パンツ")
category_4 = Category.create!(category_name: "シューズ")

sale_status_1 = SaleStatus.create!(sale_status_name: "定価")
sale_status_2 = SaleStatus.create!(sale_status_name: "セール")

product_status_1 = ProductStatus.create!(product_status_name: "新品")
product_status_2 = ProductStatus.create!(product_status_name: "中古")

product_1 = Product.create!(
  product_name: "ニット",
  category_id: category_1.id,
  price: 15000,
  description: "素材:綿50%,ウール50%, サイズ:M",
  sale_status_id: sale_status_1.id,
  product_status_id: product_status_1.id,
  regist_date: Time.new(2022, 10, 21, 13, 30, 0, "+09:00"),
  user_id: User.find_by(email: "user1@example.com").id,
  delete_flag: false,
)
product_2 = Product.create!(
  product_name: "コート",
  category_id: category_2.id,
  price: 50000,
  description: "素材:綿50%,ウール50%, サイズ:L",
  sale_status_id: sale_status_1.id,
  product_status_id: product_status_1.id,
  regist_date: Time.new(2022, 10, 21, 13, 30, 0, "+09:00"),
  user_id: User.find_by(email: "user2@example.com").id,
  delete_flag: false,
)
product_3 = Product.create!(
  product_name: "スラックス",
  category_id: category_3.id,
  price: 12000,
  description: "素材:綿30%,ウール70%, サイズ:M",
  sale_status_id: sale_status_2.id,
  product_status_id: product_status_2.id,
  regist_date: Time.new(2022, 10, 21, 13, 30, 0, "+09:00"),
  user_id: User.find_by(email: "user1@example.com").id,
  delete_flag: false,
)
product_4 = Product.create!(
  product_name: "スニーカー",
  category_id: category_4.id,
  price: 20000,
  description: "素材:キャンパス, サイズ:27.0cm",
  sale_status_id: sale_status_1.id,
  product_status_id: product_status_1.id,
  regist_date: Time.new(2022, 10, 21, 14, 0o0, 0, "+09:00"),
  user_id: User.find_by(email: "user2@example.com").id,
  delete_flag: false,
)

Purchase.create!(
  [
    {
      purchase_price: 10000,
      purchase_quantity: 2,
      purchase_company: "hoge株式会社",
      order_date: Time.new(2022, 10, 21, 14, 0o0, 0, "+09:00"),
      purchase_date: Time.new(2022, 10, 25, 14, 0o0, 0, "+09:00"),
      product_id: product_1.id,
    },
    {
      purchase_price: 15000,
      purchase_quantity: 1,
      purchase_company: "foo株式会社",
      order_date: Time.new(2022, 10, 22, 14, 0o0, 0, "+09:00"),
      purchase_date: Time.new(2022, 10, 26, 14, 0o0, 0, "+09:00"),
      product_id: product_4.id,
    },
  ],
)

sent_shipment_status = ShipmentStatus.create!(shipment_status_name: "発送済")
shipping_preparation_status = ShipmentStatus.create!(shipment_status_name: "準備中")

order_1 = Order.create!(
  user_id: User.find_by(email: "user1@example.com").id,
  order_date: Time.new(2022, 10, 22, 14, 0o0, 0, "+09:00"),
  order_number: "%011d" % 1,
)
order_2 = Order.create!(
  user_id: User.find_by(email: "user2@example.com").id,
  order_date: Time.new(2022, 10, 22, 14, 0o0, 0, "+09:00"),
  order_number: "%012d" % 1,
)

OrderDetail.create!(
  [
    {
      product_id: product_1.id,
      order_id: order_1.id,
      shipment_status_id: sent_shipment_status.id,
      order_quantity: 2,
      shipment_date: Time.new(2022, 10, 22, 14, 0o0, 0, "+09:00"),
    },
    {
      product_id: product_2.id,
      order_id: order_1.id,
      shipment_status_id: sent_shipment_status.id,
      order_quantity: 2,
      shipment_date: Time.new(2022, 10, 22, 14, 0o0, 0, "+09:00"),
    },
    {
      product_id: product_3.id,
      order_id: order_1.id,
      shipment_status_id: sent_shipment_status.id,
      order_quantity: 2,
      shipment_date: Time.new(2022, 10, 22, 14, 0o0, 0, "+09:00"),
    },
    {
      product_id: product_4.id,
      order_id: order_1.id,
      shipment_status_id: sent_shipment_status.id,
      order_quantity: 2,
      shipment_date: Time.new(2022, 10, 22, 14, 0o0, 0, "+09:00"),
    },
    {
      product_id: product_1.id,
      order_id: order_2.id,
      shipment_status_id: shipping_preparation_status.id,
      order_quantity: 2,
      shipment_date: Time.new(2022, 10, 22, 14, 0o0, 0, "+09:00"),
    },
    {
      product_id: product_2.id,
      order_id: order_2.id,
      shipment_status_id: shipping_preparation_status.id,
      order_quantity: 2,
      shipment_date: Time.new(2022, 10, 22, 14, 0o0, 0, "+09:00"),
    },
    {
      product_id: product_3.id,
      order_id: order_2.id,
      shipment_status_id: shipping_preparation_status.id,
      order_quantity: 2,
      shipment_date: Time.new(2022, 10, 22, 14, 0o0, 0, "+09:00"),
    },
    {
      product_id: product_4.id,
      order_id: order_2.id,
      shipment_status_id: shipping_preparation_status.id,
      order_quantity: 2,
      shipment_date: Time.new(2022, 10, 22, 14, 0o0, 0, "+09:00"),
    },
  ],
)
