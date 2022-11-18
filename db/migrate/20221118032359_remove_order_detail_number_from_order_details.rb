class RemoveOrderDetailNumberFromOrderDetails < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_details, :order_detail_number, :string
  end
end
