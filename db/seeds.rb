# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_classification = UserClassification.create!(user_classification_name: "一般ユーザー")
User.create!([{ email: "user001@example.com", password: "password1234", first_name: "user", last_name: "001",
             user_classification_id: user_classification.id, zipcode: "123-4567", prefecture: "東京都", municipality: "千代田区", address: "代々木1丁目31-1",
             apartments: "代々木ビル1F", phone_number: "0366192257", company_name: "株式会社 清水塾" },
             { email: "user002@example.com", password: "password1234", first_name: "user", last_name: "002",
              user_classification_id: user_classification.id, zipcode: "123-4567", prefecture: "東京都", municipality: "千代田区", address: "代々木2丁目5-1",
              apartments:"代々木ビル1F", phone_number:"0366192256", company_name: "株式会社 清水塾" }])
