# frozen_string_literal: true

require 'open-uri'

# Service to generate git profile
class GenerateGitProfileService
  attr_reader :data

  def initialize(url)
    @doc = Nokogiri::HTML(open_url(url).read)
    @data = perform
  end

  def self.call(url)
    new(url).data
  end

  private

  def perform
    { **fetch_followers, **fetch_optional_data, **fetch_user_base_data, **fetch_aditional_data }
  end

  def open_url(url)
    res = Net::HTTP.get_response(URI(url))
    url = 'https://github.com' if res.code == '404'

    URI.parse(url).open
  end

  def fetch_followers
    followers, following = @doc.css('.Link--secondary')&.css('.text-bold')
    { followers: followers&.text, following: following&.text }
  end

  def fetch_user_base_data
    { user_name: @doc.css('.p-name')&.text.strip,
      user_nickname: @doc.css('.p-nickname')&.text.strip }
  end

  def fetch_optional_data
    { organization: @doc.css('.js-profile-editable-area')&.css('.p-org')&.children.text,
      location: @doc.css('.js-profile-editable-area')&.css('[itemprop="homeLocation"]')&.css('.p-label')&.text }
  end

  def fetch_aditional_data
    { stars: @doc.css('[data-tab-item="stars"]')&.css('.Counter')&.first&.text,
      last_year_contrib: @doc.css('.js-yearly-contributions')&.css('.f4')&.text.split.first,
      avatar: @doc.css('.avatar-user')&.css('.width-full')&.last&.attributes&.fetch('src', nil)&.value }
  end
end
