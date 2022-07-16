class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :reference
      t.string :name
      t.text :description
      t.integer :price, null: false
      t.boolean :actived, default: true
      t.decimal :cannon, default: 0
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :products, :reference, unique: true
  end
end