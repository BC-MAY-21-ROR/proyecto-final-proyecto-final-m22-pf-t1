class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.datetime :date, null: false
      t.references :customer, null: false, foreign_key: true
      t.integer :amount, default: 0

      t.timestamps
    end
  end
end
