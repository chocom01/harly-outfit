# frozen_string_literal: true

class OptionValue < ApplicationRecord
  belongs_to :option_type
  has_and_belongs_to_many :variants
end
