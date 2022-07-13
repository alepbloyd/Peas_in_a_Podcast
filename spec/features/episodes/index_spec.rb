require 'rails_helper'

RSpec.describe 'episode index', type: :feature do
# User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:

  it 'displays index of podcast episodes with attributes' do
    podcast_1 = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)

    episode_1 = podcast_1.episodes.create!(title: "Criminal: The first episode", length_in_seconds: 1000, marked_explicit: true)
    episode_2 = podcast_1.episodes.create!(title: "Criminal: The second episode", length_in_seconds: 123, marked_explicit: false)
    episode_3 = podcast_1.episodes.create!(title: "Criminal: The third episode", length_in_seconds: 10000, marked_explicit: true)

    visit "/episodes"

    expect(page).to have_content(episode_1.title)
    expect(page).to have_content(episode_1.time_format)
    expect(page).to have_content(episode_1.marked_explicit)

    expect(page).to have_content(episode_3.title)
    expect(page).to have_content(episode_3.time_format)
    expect(page).to have_content(episode_3.marked_explicit)
  end

  it 'only diplays episodes that are marked explicit' do

    podcast_1 = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)

    episode_1 = podcast_1.episodes.create!(title: "Criminal: The first episode", length_in_seconds: 1000, marked_explicit: true)
    episode_2 = podcast_1.episodes.create!(title: "Criminal: The second episode", length_in_seconds: 123, marked_explicit: false)
    episode_3 = podcast_1.episodes.create!(title: "Criminal: The third episode", length_in_seconds: 10000, marked_explicit: true)

    visit '/episodes'

    expect(page).to have_content(episode_1.title)

    expect(page).to have_content(episode_3.title)

    expect(page).not_to have_content(episode_2.title)
  end

  it 'contains a link next to each episode name, linking to episode edit page' do
    podcast_1 = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)

    episode_1 = podcast_1.episodes.create!(title: "Criminal: The first episode", length_in_seconds: 1000, marked_explicit: true)
    episode_2 = podcast_1.episodes.create!(title: "Criminal: The second episode", length_in_seconds: 123, marked_explicit: false)
    episode_3 = podcast_1.episodes.create!(title: "Criminal: The third episode", length_in_seconds: 10000, marked_explicit: true)

    visit '/episodes'

    within '#episode-1' do
      click_link "Edit"
      expect(current_path).to eq("/episodes/#{episode_1.id}/edit")
    end

    visit '/episodes'

    within '#episode-2' do
      click_link "Edit"
      expect(current_path).to eq("/episodes/#{episode_3.id}/edit")
    end

    visit "/podcasts/#{podcast_1.id}/episodes"

    within '#episode-1' do
      click_link "Edit"
      expect(current_path).to eq("/episodes/#{episode_1.id}/edit")
    end

  end

  it 'has delete link next to each episode, deleting the episode and returning to the episode index page' do
    podcast_1 = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)

    episode_1 = podcast_1.episodes.create!(title: "Criminal: The first episode", length_in_seconds: 1000, marked_explicit: true)
    episode_2 = podcast_1.episodes.create!(title: "Criminal: The second episode", length_in_seconds: 123, marked_explicit: true)
    episode_3 = podcast_1.episodes.create!(title: "Criminal: The third episode", length_in_seconds: 10000, marked_explicit: true)

    visit '/episodes'

    within '#episode-1' do
      click_link "Delete"
    end

    expect(current_path).to eq("/episodes")

    expect(page).to_not have_content(episode_1.title)
    expect(page).to have_content(episode_2.title)
    expect(page).to have_content(episode_3.title)
  end

  it 'has search box to find and return podcasts by with an exact string match to the search term' do
    podcast_1 = Podcast.create!(name: "This Canadian Death", in_production: true, ad_slot_cost: 950.25)

    episode_1 = podcast_1.episodes.create!(title: "Tim Horton's Donut Distaster", length_in_seconds: 1000, marked_explicit: true)
    episode_2 = podcast_1.episodes.create!(title: "Hockey Pucks - A Public Health Crisis", length_in_seconds: 123, marked_explicit: false)
    episode_3 = podcast_1.episodes.create!(title: "Lost in Drake's Toronto Mansion", length_in_seconds: 10000, marked_explicit: true)

    visit "/episodes"

    fill_in "exact_match_search", with: "Tim Horton's Donut Distaster"

    click_on "Exact Title Search"

    expect(current_path).to eq("/episodes")

    expect(page).to have_content(episode_1.title)

    expect(page).to_not have_content(episode_2.title)
    expect(page).to_not have_content(episode_3.title)
  end

  it 'has search box to find and return episodes with a partial string match to the search term' do
    podcast_1 = Podcast.create!(name: "This Canadian Death", in_production: true, ad_slot_cost: 950.25)

    episode_1 = podcast_1.episodes.create!(title: "Tim Horton's Donut Distaster", length_in_seconds: 1000, marked_explicit: true)
    episode_2 = podcast_1.episodes.create!(title: "Tim Pucks - A Public Health Crisis", length_in_seconds: 123, marked_explicit: false)
    episode_3 = podcast_1.episodes.create!(title: "Lost in Drake's Toronto Mansion", length_in_seconds: 10000, marked_explicit: true)

    visit "/episodes"

    fill_in 'partial_match_search', with: "Tim"

    click_on 'Partial Title Search'

    expect(current_path).to eq("/episodes")

    expect(page).to have_content(episode_1.title)
    expect(page).to have_content(episode_2.title)

    expect(page).to_not have_content(episode_3.title)
  end

  it 'displays length in readable format' do
    podcast_1 = Podcast.create!(name: "This Canadian Death", in_production: true, ad_slot_cost: 950.25)

    episode_1 = podcast_1.episodes.create!(title: "Tim Horton's Donut Distaster", length_in_seconds: 3661, marked_explicit: true)

    visit '/episodes'

    within '#episode-1' do
      expect(page).to have_content("1 Hour, 1 Minute, 1 Second")
    end
  end

end