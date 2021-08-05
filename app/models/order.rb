# frozen_string_literal: true

class Order < ApplicationRecord
  enum status: {
    cart: 0,
    paid: 1
  }

  paginates_per 10
  has_many :order_items
  has_many :products, through: :order_items
  belongs_to :user

  scope :available_cart, -> { where(status: 'cart') }

  after_touch :sum_products_price

  private

  def sum_products_price
    self.sum_cents = products.sum(:price_cents)
    save
  end
end
