class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :invoice, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, default: 1
      t.integer :adjustment, default: 0
      t.references :stylist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
