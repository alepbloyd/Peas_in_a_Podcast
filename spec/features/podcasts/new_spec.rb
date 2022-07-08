require 'rails_helper'

RSpec.describe 'New Podcast' do
  describe 'As a visitor' do
    describe 'When I visit the new podcast form by clicking a link on the index' do
      it 'I can create a new podcast' do
        visit '/podcasts'

        click_link 'Create new podcast'

        expect(current_path).to eq('/podcasts/new')

        fill_in 'name', with: 'Snack Chat'
        check 'in_production'
        fill_in 'ad_slot_cost', with: 12.50
        click_on 'Submit'

        expect(current_path).to eq('/podcasts')
        expect(page).to have_content("Snack Chat")
      end
    end
  end
end