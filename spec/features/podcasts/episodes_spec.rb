require 'rails_helper'

RSpec.describe 'podcasts/:id/episodes', type: :feature do

  it 'shows episodes and attributes for given podcast' do
    # User Story 5, Parent Children Index 

    # As a visitor
    # When I visit '/parents/:parent_id/child_table_name'
    # Then I see each Child that is associated with that Parent with each Child's attributes:

    podcast_1 = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)

    episode_1 = podcast_1.episodes.create!(title: "Criminal: The first episode", length_in_seconds: 1000, marked_explicit: true)
    episode_2 = podcast_1.episodes.create!(title: "Criminal: The second episode", length_in_seconds: 123, marked_explicit: false)
    episode_3 = podcast_1.episodes.create!(title: "Criminal: The third episode", length_in_seconds: 10000, marked_explicit: true)

    visit "/podcasts/#{podcast_1.id}/episodes"

    expect(page).to have_content(podcast_1.name)
    expect(page).to have_content(episode_1.title)
    expect(page).to have_content(episode_1.length_in_seconds)
    expect(page).to have_content(episode_1.marked_explicit)
  end

end