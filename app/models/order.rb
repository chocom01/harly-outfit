# frozen_string_literal: true

class Order < ApplicationRecord
  enum status: {
    cart: 0,
    paid: 1
  }

  has_many :order_items
  has_many :products, through: :order_items
  belongs_to :user
end
