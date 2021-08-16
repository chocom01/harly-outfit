class AddDefaultStatusForQuantity < ActiveRecord::Migration[6.1]
  def change
    change_column :order_items, :quantity, :integer, default: 0
  end
end
