# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Member, type: :model do
  context 'when name is blank' do
    it 'should not save' do
      member = Member.new
      expect(member).not_to be_valid
    end
  end

  context 'when name is present' do
    it 'should save successfully' do
      member = Member.new(name: 'a valid name')
      expect(member).to be_valid
    end
  end
end
