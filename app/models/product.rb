class Product < ApplicationRecord
  paginates_per 10
  has_many :orders, through: :order_items
  has_many :orders
  has_many :reviews
  has_many :photos, dependent: :destroy
end
