class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      t.string :name
      t.string :contact
      t.string :phone
      t.text :comment

      t.timestamps null: false
    end
  end
end
