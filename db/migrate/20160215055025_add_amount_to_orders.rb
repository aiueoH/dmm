class AddAmountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :amount, :integer
  end
end
