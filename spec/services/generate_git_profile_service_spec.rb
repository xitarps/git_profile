# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GenerateGitProfileService do
  describe '.call' do
    context 'when generate git profile' do
      let(:url) { 'https://github.com/xitarps' }

      subject { GenerateGitProfileService.call(url) }

      it 'return user attributes from github' do
        expect(subject.keys).to eq(
          %i[followers following organization location user_name user_nickname
             stars last_year_contrib avatar]
        )
        expect(subject[:user_nickname]).to be_eql('xitarps')
      end
    end

    context 'when invalid url' do
      let(:invalid_url) { 'https://github.com/repositoryinvalid' }

      subject { GenerateGitProfileService.call(invalid_url) }

      output = { avatar: nil, followers: nil, following: nil, last_year_contrib: nil,
                 location: '', organization: '', stars: nil, user_name: '', user_nickname: '' }

      it 'returns error status' do
        expect(subject).to be_eql(output)
      end
    end
  end
end
