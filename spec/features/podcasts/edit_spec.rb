require 'rails_helper'

RSpec.describe 'Podcast Update' do

  describe 'As a visitor' do

    describe 'When I visit the podcast update form by clicking a link on the show page' do
      
      it 'I can update an existing podcast' do
        podcast_1 = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)

        visit "/podcasts/#{podcast_1.id}"

        click_link 'Edit Podcast Info'

        expect(current_path).to eq("/podcasts/#{podcast_1.id}/edit")

        fill_in 'name', with: "Spicy Time"
        uncheck 'in_production'
        fill_in 'ad_slot_cost', with: 200
        click_on 'Submit'

        expect(current_path).to eq("/podcasts/#{podcast_1.id}")
        expect(page).to have_content("Spicy Time")
      end

    end

  end

end