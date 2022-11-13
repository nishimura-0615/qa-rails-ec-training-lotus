class CreateProductStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :product_statuses do |t|
      t.string :product_status_name, :string_limit, :limit => 32
      t.timestamps
    end
  end
end
