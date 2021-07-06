class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :price_cents
      t.integer :status
      t.datetime :departure_date
      t.datetime :delivery_date

      t.timestamps
    end
  end
end
