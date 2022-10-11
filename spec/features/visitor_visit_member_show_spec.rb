# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visitor' do
  let(:member) { Member.create(name: 'testing') }
  let!(:repository) { Repository.create(member: member, url: 'https://github.com/matz') }
  describe 'visit' do
    context 'member form' do
      it 'successfully' do
        visit member_path(member)

        expect(page).to have_content(I18n.t('shared.navbar.home'))
      end
    end
  end
end
