class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :user_id
      t.string :item_name
      t.integer :item_amount
      t.integer :item_quantity

      t.timestamps null: false
    end
  end
end
