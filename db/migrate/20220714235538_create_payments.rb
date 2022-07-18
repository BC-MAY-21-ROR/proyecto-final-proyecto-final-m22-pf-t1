class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.datetime :date, null: false
      t.references :invoice, null: false, foreign_key: true
      t.integer :value, null: false
      t.string :type
      t.string :note

      t.timestamps
    end
  end
end
