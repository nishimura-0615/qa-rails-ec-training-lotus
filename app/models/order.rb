class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy

  def total_price
    order_details.sum(&:sub_total)
  end

  def prepared?
    order_details.any? { |order_detail| order_detail.shipment_status.shipment_status_name == "準備中" }
  end

  def delivered?
    order_details.any? { |order_detail| order_detail.shipment_status.shipment_status_name == "発送済" }
  end
end
