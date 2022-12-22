class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy

  def total_price
    sub_totals = []
    order_details.each do |order_detail|
      sub_totals << order_detail.sub_total
    end
    sub_totals.sum
  end

  def preparation?
    order_details.each do |_order_detail|
      order_details.any? { |order_details| order_details.shipment_status.shipment_status_name == "準備中" }
    end
  end
end
