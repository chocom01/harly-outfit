class Order < ApplicationRecord
  has_many :products, through: :order_items
  has_many :products
  belongs_to :user
end
