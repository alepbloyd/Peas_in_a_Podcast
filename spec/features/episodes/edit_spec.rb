require 'rails_helper'

RSpec.describe 'Child Update' do

  describe 'As a visitor' do

    describe 'when I visit an episode show page' do

      it 'has link "Update Episode" that takes me to /episodes/:id/edit, where I see a form to edit the episode attributes' do
        
        podcast_1 = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)

        episode_1 = podcast_1.episodes.create!(title: "Criminal: The first episode", length_in_seconds: 1000, marked_explicit: true)

        visit "/episodes/#{episode_1.id}"

        click_link "Update Episode"

        expect(current_path).to eq("/episodes/#{episode_1.id}/edit")

        fill_in 'title', with: "Happy Birthday to You"
        uncheck 'marked_explicit'
        fill_in 'length_in_seconds', with: 900
        click_on 'Update Episode'

        expect(current_path).to eq("/episodes/#{episode_1.id}")
        expect(page).to have_content("Happy Birthday to You")
      end

    end

  end

end