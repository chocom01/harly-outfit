class AddReferenceToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :order_items, :variant, foreign_key: true
  end
end
