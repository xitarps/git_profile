require 'rails_helper'

RSpec.describe GenerateGitProfileService do
  describe '.call' do
    context 'when generate git profile' do
      let(:url) { 'https://github.com/xitarps' }

      subject { GenerateGitProfileService.call(url) }

      it 'return user attributes from github' do
        expect(subject).to eq(
          {
            followers: '54',
            following: '58',
            organization: '',
            location: '',
            user_name: 'Rodrigo Pimentel Sátyro Xita',
            user_nickname: 'xitarps',
            stars: '12',
            last_year_contrib: '453',
            avatar: 'https://avatars.githubusercontent.com/u/36175757?v=4'
          }
        )
      end
    end

    context 'when invalid url' do
      let(:invalid_url) { 'https://github.com/repositoryinvalid' }

      subject { GenerateGitProfileService.call(invalid_url) }

      output = { avatar:nil, followers:nil, following:nil, last_year_contrib:nil,
                 location:"", organization:"", stars:nil, user_name:"", user_nickname:"" }

      it 'returns error status' do
        expect(subject).to be_eql(output)
      end
    end
  end
end
