# frozen_string_literal: true

class Order < ApplicationRecord
  enum status: {
    cart: 0,
    paid: 1
  }

  paginates_per 10
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items, dependent: :destroy
  belongs_to :user

  def update_sum_price
    self.sum_cents = self.order_items.sum do |item|
      item.product.price_cents * item.quantity
    end
    save
  end
end
