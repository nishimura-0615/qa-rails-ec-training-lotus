class CreateUserClassifications < ActiveRecord::Migration[7.0]
  def change
    create_table :user_classifications do |t|
      t.string :user_classification_name, limit: 32, null: false

      t.timestamps
    end
  end
end
