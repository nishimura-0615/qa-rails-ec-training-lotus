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
end
