class Product < ApplicationRecord
  has_many :orders, through: :orders_items
  has_many :reviews
end
