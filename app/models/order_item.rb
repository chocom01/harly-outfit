# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  after_create :item_quantity_increment
  after_touch :item_quantity_increment

  private

  def item_quantity_increment
    OrderItem.increment_counter(:quantity, self.id)
  end
end
