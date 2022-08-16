class RenameTypeToKindInPayments < ActiveRecord::Migration[7.0]
  def up
    rename_column :payments, :type, :kind
  end

  def down
    rename_column :payments, :kind, :type
  end
end
