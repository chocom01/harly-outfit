class CreateOptionTypesProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :option_types_products, id: false do |t|
      t.belongs_to :product
      t.belongs_to :option_type
    end
  end
end
