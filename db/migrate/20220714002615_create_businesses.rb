class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :nit, unique: true
      t.string :country
      t.string :city
      t.string :telephone
      t.string :email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
