# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visitor' do
  describe 'search' do
    context 'member' do
      let(:member) { Member.create(name: 'Matz') }
      let!(:repository) { Repository.create(member: member, url: 'https://github.com/matz') }
      it 'successfully' do
        arg = 'matz'
        visit "/members/search?search%5Barg%5D=#{arg}&commit=Busca"

        expect(page).to have_content('Matz')
      end
      it 'no result' do
        arg = 'test'
        visit "/members/search?search%5Barg%5D=#{arg}&commit=Busca"

        expect(page).not_to have_content('Matz')
      end
    end
  end
end
