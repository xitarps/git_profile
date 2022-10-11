# frozen_string_literal: true

# Repository model layer
class Repository < ApplicationRecord
  belongs_to :member

  validates :url, presence: true
  validates :url, uniqueness: true
  validates :url, format: { with: /\Ahttps:\/\/(github||gitlab).com\/[a-z]{1,}/i, message: :error }
end
