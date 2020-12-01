# frozen_string_literal: true

# Model result
class Result < ApplicationRecord
  validates :value, presence: true, numericality: { greater_than_or_equal_to: 0 }, uniqueness: true
  validates :result, presence: true
end
