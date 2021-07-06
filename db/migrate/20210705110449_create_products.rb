class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price_cents
      t.string :sizes, array: true, default: []
      t.integer :gender

      t.timestamps
    end
  end
end
