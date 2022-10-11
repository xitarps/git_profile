# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Update Member' do
  let(:member) { Member.create(name: 'tester') }

  context 'when has valid params' do
    it 'should save successfully' do
      args = { member: { name: 'a valid name' } }

      put(member_path(member), params: args)

      expect(Member.first&.name).to eq(args[:member][:name])
    end
  end

  context 'when doesen\'t has valid params' do
    it 'should not save' do
      args = { member: { name: '' } }

      put(member_path(member), params: args)

      expect(Member.first&.name).not_to eq(args[:member][:name])
    end
  end
end
