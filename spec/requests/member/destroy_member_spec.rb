# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Destroy Member' do
  context 'when hit a delete member route' do
    it 'should destroy successfully' do
      member = Member.create(name: 'One member')

      delete member_path(member)

      expect(Member.any?).to be_falsy
    end
  end
end
