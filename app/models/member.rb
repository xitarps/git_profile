# frozen_string_literal: true

class Member < ApplicationRecord
  validates :name, presence: true
end
