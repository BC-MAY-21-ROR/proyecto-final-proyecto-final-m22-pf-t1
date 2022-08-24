class AddBusinessIdToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :business_id, :integer
  end
end
