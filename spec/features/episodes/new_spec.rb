require 'rails_helper'

RSpec.describe 'Parent Child Creation' do

  describe 'As a visitor' do
    describe 'when I visit a podcast episodes index page' do
       it 'takes me to /podcasts/:podcast_id/episodes/new' do
        podcast_1 = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)

        episode_1 = podcast_1.episodes.create!(title: "Criminal: The first episode", length_in_seconds: 1000, marked_explicit: true) 

        visit "/podcasts/#{podcast_1.id}/episodes"

        click_link 'Create Episode'

        expect(current_path).to eq("/podcasts/#{podcast_1.id}/episodes/new")

        fill_in 'title', with: 'Look a new episode'
        check 'marked_explicit'
        fill_in 'length_in_seconds', with: 200
        click_on 'Create Episode'

        expect(current_path).to eq("/podcasts/#{podcast_1.id}/episodes")
        expect(page).to have_content("Look a new episode")
       end
    end
  end
end