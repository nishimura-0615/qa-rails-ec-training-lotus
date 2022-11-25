class RenameResistDateColummToProducts < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :resist_date, :regist_date
  end
end
