class Order < ApplicationRecord
  has_many :products, through: :order_items
  belongs_to :user
end
