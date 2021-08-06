# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  after_create :items_count_increment
  after_touch :items_count_increment

  private

  def items_count_increment
    OrderItem.increment_counter(:items_count, self.id)
  end
end
