class CreateOptionValuesVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :option_values_variants, id: false  do |t|
      t.belongs_to :variant
      t.belongs_to :option_value

      t.timestamps
    end
  end
end
