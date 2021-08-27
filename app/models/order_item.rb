# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :variant

  validate :variant_availability

  private

  def variant_availability
    if self.quantity > self.variant.availability
      errors.add(:variant, 'Does not have so many pieces in stock')
    end
  end
end
