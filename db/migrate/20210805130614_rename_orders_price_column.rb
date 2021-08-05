class RenameOrdersPriceColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :price_cents, :sum_cents
  end
end
