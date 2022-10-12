# frozen_string_literal: true

class Member < ApplicationRecord
  include Searchable

  has_many :repositories, dependent: :destroy
  accepts_nested_attributes_for :repositories

  validates :name, presence: true
end
