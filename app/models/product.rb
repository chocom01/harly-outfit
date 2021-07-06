class Product < ApplicationRecord
  has_many :orders, through: :order_items
  has_many :reviews
end
