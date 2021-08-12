# frozen_string_literal: true

class Product < ApplicationRecord
  enum gender: {
    Male: 0,
    Female: 1
  }

  paginates_per 10
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy
end
