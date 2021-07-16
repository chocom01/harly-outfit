class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.text :image_data
      t.belongs_to :product
      t.timestamps
    end
  end
end
