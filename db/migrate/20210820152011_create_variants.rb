class CreateVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :variants do |t|
      t.belongs_to :product
      t.integer :availability, default: 0

      t.timestamps
    end
  end
end
