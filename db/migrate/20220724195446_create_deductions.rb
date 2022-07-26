class CreateDeductions < ActiveRecord::Migration[7.0]
  def change
    create_table :deductions do |t|
      t.datetime :date, null: false
      t.integer :amount, null: false
      t.references :stylist, null: false, foreign_key: true
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
