class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :dni
      t.string :full_name, null: false
      t.string :telephone
      t.string :birthday
      t.string :email
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
