class CreateCatalogs < ActiveRecord::Migration[7.0]
  def change
    create_table :catalogs do |t|
      t.string :reference
      t.string :name
      t.text :description
      t.integer :price
      t.boolean :actived, default: true

      t.timestamps
    end
  end
end
