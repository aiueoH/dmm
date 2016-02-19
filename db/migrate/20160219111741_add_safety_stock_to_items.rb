class AddSafetyStockToItems < ActiveRecord::Migration
  def change
    add_column :items, :safety_stock, :integer, default: 0
  end
end
