class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :sale_status
  belongs_to :product_status
  has_many :order_details, dependent: :nullify
  has_many :purchases, dependent: :destroy
end
