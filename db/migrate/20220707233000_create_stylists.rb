class CreateStylists < ActiveRecord::Migration[7.0]
  def change
    create_table :stylists do |t|
      t.string :dni
      t.string :name
      t.boolean :actived
      t.string :role

      t.timestamps
    end
  end
end
