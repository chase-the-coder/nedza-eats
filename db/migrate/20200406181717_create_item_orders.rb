class CreateItemOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :item_orders do |t|
      t.string :instructions
      t.integer :quantity
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true
      t.boolean :gluten_free, default: false

      t.timestamps
    end
  end
end
