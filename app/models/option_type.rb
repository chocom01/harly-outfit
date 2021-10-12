# frozen_string_literal: true

class OptionType < ApplicationRecord
  has_many :option_values
  has_and_belongs_to_many :products
end
