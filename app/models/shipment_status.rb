class ShipmentStatus < ApplicationRecord
  has_many :order_details, dependent: :destory
end
