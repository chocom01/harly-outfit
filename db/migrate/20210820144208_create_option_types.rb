class CreateOptionTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :option_types do |t|
      t.string :name
      t.string :presentation

      t.timestamps
    end
  end
end
