class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :price_sum
      t.integer :status
      t.date :departure_date
      t.date :delivery_date

      t.timestamps
    end
  end
end
