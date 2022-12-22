class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy

  def total_price
    order_details.sum(&:sub_total)
  end

  def prepared?
    order_details.each do |_order_detail|
      order_details.any? { |order_details| order_details.shipment_status.shipment_status_name == "準備中" }
    end
  end
end
