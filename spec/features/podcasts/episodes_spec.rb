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

  it 'has link to display episodes in alphabetical order' do

    podcast = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)

    episode_1 = podcast.episodes.create!(title: "B - the B Episode", length_in_seconds: 1000, marked_explicit: true)
    episode_2 = podcast.episodes.create!(title: "C - the C Episode", length_in_seconds: 123, marked_explicit: false)
    episode_3 = podcast.episodes.create!(title: "A - the A Episode", length_in_seconds: 10000, marked_explicit: true)

    visit "/podcasts/#{podcast.id}/episodes"

    click_link "Sort alphabetically"

    expect(current_path).to eq("/podcasts/#{podcast.id}/episodes")

    within '#episode-1' do
      expect(page).to have_content("A - the A Episode")
    end

    within '#episode-2' do
      expect(page).to have_content("B - the B Episode")
    end

    within '#episode-3' do
      expect(page).to have_content("C - the C Episode")
    end

  end

end