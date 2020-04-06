class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :item_order, foreign_key: true
      t.string :name
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
