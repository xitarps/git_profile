# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Create Member' do
  context 'when has valid params' do
    it 'should save successfully' do
      args = { member: { name: 'a valid name' } }

      post(members_path, params: args)

      expect(Member.first&.name).to eq(args[:member][:name])
    end
  end

  context 'when doesen\'t has valid params' do
    it 'should not save' do
      args = { member: { name: '' } }

      post(members_path, params: args)

      expect(Member.first&.name).not_to eq(args[:member][:name])
    end
  end
end
