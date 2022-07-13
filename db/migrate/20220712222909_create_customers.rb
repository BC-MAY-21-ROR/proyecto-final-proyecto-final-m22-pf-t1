class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :dni
      t.string :full_name
      t.string :telephone
      t.string :birthday
      t.string :email

      t.timestamps
    end
  end
end
