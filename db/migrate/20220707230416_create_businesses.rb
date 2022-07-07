class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :nit
      t.string :owner
      t.string :country
      t.string :city
      t.string :telephone
      t.string :email

      t.timestamps
    end
  end
end
