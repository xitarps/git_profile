# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visitor' do
  describe 'visit' do
    context 'member form' do
      it 'successfully' do
        visit new_member_path

        expect(page).to have_content(I18n.t('shared.navbar.home'))
      end
    end
  end
end
