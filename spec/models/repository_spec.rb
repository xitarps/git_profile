# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Repository, type: :model do
  let(:member) { Member.create(name: 'tester') }
  let(:repository) { described_class.new(member: member) }

  context 'when url is blank' do
    it 'should not save' do
      expect(repository).not_to be_valid
    end
  end

  context 'when url is present' do
    it 'should save successfully' do
      repository.url = 'https://github.com/xitarps'
      expect(repository).to be_valid
    end
  end

  context 'when update url' do
    it 'should not have doubled repositories' do
      repository.update(url: 'https://github.com/matz')
      expect(described_class.count).to be_eql(1)
    end
  end
end
