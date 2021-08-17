# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validate :product_availability

  private

  def product_availability
    if self.quantity > self.product.availability
      errors.add(:product, 'Does not have so many pieces in stock')
    end
  end
end
