class Product < ApplicationRecord
  belongs_to :product, dependent: :destroy
end
