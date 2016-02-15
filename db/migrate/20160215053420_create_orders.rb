class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :comment
      t.integer :receiver_id
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
