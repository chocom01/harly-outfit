# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :orders, dependent: :destroy
  has_many :reviews
end
