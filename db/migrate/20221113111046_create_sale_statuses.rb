class CreateSaleStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_statuses do |t|
      t.string :sale_status, limit: 32
      t.timestamps
    end
  end
end
