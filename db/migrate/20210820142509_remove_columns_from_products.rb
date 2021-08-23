class RemoveColumnsFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :sizes
    remove_column :products, :gender
    remove_column :products, :availability
  end
end
