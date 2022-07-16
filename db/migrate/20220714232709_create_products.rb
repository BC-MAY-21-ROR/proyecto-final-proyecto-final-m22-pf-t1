class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :reference, unique: true, index: true
      t.string :name
      t.text :description
      t.integer :price, null: false
      t.boolean :actived, default: true
      t.float :cannon, default: 0
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
