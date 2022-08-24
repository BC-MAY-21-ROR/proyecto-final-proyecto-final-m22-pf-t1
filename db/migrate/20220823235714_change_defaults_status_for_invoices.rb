class ChangeDefaultsStatusForInvoices < ActiveRecord::Migration[7.0]
  def change
    change_column :invoices, :status, :string, default: "pendiente"
  end
end
