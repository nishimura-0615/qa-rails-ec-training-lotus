class RenameSaleStatusColumnToSaleStatuses < ActiveRecord::Migration[7.0]
  def change
    rename_column :sale_statuses, :sale_status, :sale_status_name
  end
end
