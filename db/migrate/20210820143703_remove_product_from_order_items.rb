class RemoveProductFromOrderItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_items, :product_id
  end
end
