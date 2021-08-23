# frozen_string_literal: true

class Order < ApplicationRecord
  enum status: {
    cart: 0,
    paid: 1
  }

  paginates_per 10
  has_many :order_items
  has_many :variants, through: :order_items
  belongs_to :user

  def update_sum_price
    self.sum_cents = self.order_items.sum do |item|
      item.product.price_cents * item.quantity
    end
    save
  end
end
