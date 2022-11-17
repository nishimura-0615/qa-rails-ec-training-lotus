class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :shipment_status

  validates :order_quantity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
end
