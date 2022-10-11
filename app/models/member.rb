# frozen_string_literal: true

class Member < ApplicationRecord
  has_many :repositories, dependent: :destroy
  accepts_nested_attributes_for :repositories

  validates :name, presence: true
end
