# frozen_string_literal: true

class Variant < ApplicationRecord
  belongs_to :product
  has_many :order_items
  has_many :orders, through: :order_items, dependent: :destroy
  has_and_belongs_to_many :option_values
end
