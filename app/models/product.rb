# frozen_string_literal: true

class Product < ApplicationRecord
  enum gender: {
    Male: 0,
    Female: 1
  }

  paginates_per 10
  has_many :reviews
  has_many :photos
  has_many :variants
  has_and_belongs_to_many :option_types

  before_destroy :stop_destroy_if_paid, prepend: true

  private

  def stop_destroy_if_paid
    if self.orders.where(status: 'paid').exists?
      errors.add(:base, :undestroyable)
      throw :abort
    end
  end
end
