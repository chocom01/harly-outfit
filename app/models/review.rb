# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validate :rights_to_live_review

  private

  def rights_to_live_review
    user_bought_product? || errors.add(:review, "user didn't buy this product")
  end

  def user_bought_product?
    Product.joins(order_items: :order)
           .where(id: product_id, orders: { user_id: user_id, status: 'paid' })
           .exists?
  end
end
