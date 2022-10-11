# frozen_string_literal: true

# Repository model layer
class Repository < ApplicationRecord
  belongs_to :member

  validates :url, presence: true
  validates :url, format: { with: /\Ahttps:\/\/(github||gitlab).com\/[a-z]{1,}/i, message: :error }

  before_save :fetch_attributes

  enum platform: { github: 0 }

  private

  def fetch_attributes
    clear_old_repositories
    assign_attributes(GenerateGitProfileService.call(url))
  end

  def clear_old_repositories
    member.repositories.destroy_all
  end
end
