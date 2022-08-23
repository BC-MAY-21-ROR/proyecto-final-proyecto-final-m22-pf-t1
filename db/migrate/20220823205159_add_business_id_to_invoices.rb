class AddBusinessIdToInvoices < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :business_id, :integer
  end
end
