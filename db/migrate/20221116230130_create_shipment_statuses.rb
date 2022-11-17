class CreateShipmentStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipment_statuses do |t|
      t.string :shipment_status_name, limit: 32, null: false

      t.timestamps
    end
  end
end
