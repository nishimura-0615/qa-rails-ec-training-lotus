class RenameProductQuantityColummToPurchases < ActiveRecord::Migration[7.0]
  def change
    rename_column :purchases, :product_quantity, :purchase_quantity
  end
end
