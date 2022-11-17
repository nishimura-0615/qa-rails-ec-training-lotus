class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :shipment_status

  VALID_NUMBER_REGEX = /\A[0-9]+\z/.freeze
  validates :order_quantity, length: { minimum: 1 }, format: { with: VALID_NUMBER_REGEX }
end
