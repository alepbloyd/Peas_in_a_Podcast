require 'rails_helper'

RSpec.describe 'podcast index', type: :feature do
  # User Story 1, Parent Index 

  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system

  it 'displays the name of each podcast on index' do
    podcast_1 = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)
    podcast_2 = Podcast.create!(name: "Maintenance Phase", in_production: true, ad_slot_cost: 500)

    visit "/podcasts"

    expect(page).to have_content(podcast_1.name)
    expect(page).to have_content(podcast_2.name)
  end

  # User Story 6, Parent Index sorted by Most Recently Created 

  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created

  it 'orders index by most recently created first' do

    podcast_1 = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)
    podcast_2 = Podcast.create!(name: "Maintenance Phase", in_production: true, ad_slot_cost: 500)
    podcast_3 = Podcast.create!(name: "The Daily", in_production: true, ad_slot_cost: 875.69)
    podcast_4 = Podcast.create!(name: "This American Life", in_production: false, ad_slot_cost: 1400)

    visit "/podcasts"

    within '#podcast-1' do
      expect(page).to have_content("This American Life")
    end
    
    within '#podcast-2' do
      expect(page).to have_content("The Daily")
    end

    within '#podcast-3' do
      expect(page).to have_content("Maintenance Phase")
    end

    within '#podcast-4' do
      expect(page).to have_content("Criminal")
    end
  end

  it 'displays link next to each podcast title, linking to podcast edit page' do
    podcast_1 = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)
    podcast_2 = Podcast.create!(name: "Maintenance Phase", in_production: true, ad_slot_cost: 500)
    podcast_3 = Podcast.create!(name: "The Daily", in_production: true, ad_slot_cost: 875.69)
    podcast_4 = Podcast.create!(name: "This American Life", in_production: false, ad_slot_cost: 1400)

    visit '/podcasts'

    within '#podcast-1' do
      click_link "Edit"
      expect(current_path).to eq("/podcasts/#{podcast_4.id}/edit")
    end

    visit '/podcasts'
    
    within '#podcast-2' do
      click_link "Edit"
      expect(current_path).to eq("/podcasts/#{podcast_3.id}/edit")
    end
    
    visit '/podcasts'
    
    within '#podcast-3' do
      click_link "Edit"
      expect(current_path).to eq("/podcasts/#{podcast_2.id}/edit")
    end
    
    visit '/podcasts'
    
    within '#podcast-4' do
      click_link "Edit"
      expect(current_path).to eq("/podcasts/#{podcast_1.id}/edit")
    end
  end

  it 'has link to podcast details page' do
    podcast_1 = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)
    podcast_2 = Podcast.create!(name: "Maintenance Phase", in_production: true, ad_slot_cost: 500)
    podcast_3 = Podcast.create!(name: "The Daily", in_production: true, ad_slot_cost: 875.69)
    podcast_4 = Podcast.create!(name: "This American Life", in_production: false, ad_slot_cost: 1400)

    p1_e1 = podcast_1.episodes.create!(title: "test_ep_1", marked_explicit: true, length_in_seconds: 23)
    p1_e2 = podcast_1.episodes.create!(title: "test_ep_2", marked_explicit: true, length_in_seconds: 26)

    visit '/podcasts'

    within '#podcast-1' do
      click_link "Details"
      expect(current_path).to eq("/podcasts/#{podcast_4.id}")
    end

  end

  it 'has link next to every podcast to delete and return to index' do
    podcast_1 = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)
    podcast_2 = Podcast.create!(name: "Maintenance Phase", in_production: true, ad_slot_cost: 500)
    podcast_3 = Podcast.create!(name: "The Daily", in_production: true, ad_slot_cost: 875.69)
    podcast_4 = Podcast.create!(name: "This American Life", in_production: false, ad_slot_cost: 1400)

    p1_e1 = podcast_1.episodes.create!(title: "test_ep_1", marked_explicit: true, length_in_seconds: 23)
    p1_e2 = podcast_1.episodes.create!(title: "test_ep_2", marked_explicit: true, length_in_seconds: 26)
    
    visit '/podcasts'

    within '#podcast-1' do
      click_link "Delete"
    end

    expect(current_path).to eq("/podcasts")

    expect(page).to have_content(podcast_3.name)
    expect(page).to_not have_content(podcast_4.name)
  end

  it 'has link to sort podcasts by number of episodes, returning user to index, and has number of episodes next to each podcast name' do

    podcast_1 = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)
    podcast_2 = Podcast.create!(name: "Maintenance Phase", in_production: true, ad_slot_cost: 500)
    podcast_3 = Podcast.create!(name: "The Daily", in_production: true, ad_slot_cost: 875.69)

    p1_e1 = podcast_1.episodes.create!(title: "test_ep_1", marked_explicit: true, length_in_seconds: 23)
    p1_e2 = podcast_1.episodes.create!(title: "test_ep_2", marked_explicit: true, length_in_seconds: 26)
    p1_e3 = podcast_1.episodes.create!(title: "test_ep_3", marked_explicit: true, length_in_seconds: 26)

    p2_e1 = podcast_2.episodes.create!(title: "test_ep_1", marked_explicit: true, length_in_seconds: 23)
    p2_e2 = podcast_2.episodes.create!(title: "test_ep_2", marked_explicit: true, length_in_seconds: 26)
    p2_e3 = podcast_2.episodes.create!(title: "test_ep_3", marked_explicit: true, length_in_seconds: 26)
    p2_e4 = podcast_2.episodes.create!(title: "test_ep_4", marked_explicit: true, length_in_seconds: 26)
    p2_e5 = podcast_2.episodes.create!(title: "test_ep_5", marked_explicit: true, length_in_seconds: 26)

    p3_e1 = podcast_3.episodes.create!(title: "test_ep_1", marked_explicit: true, length_in_seconds: 26)

    visit "/podcasts"

    click_link "Sort by Number of Episodes"

    expect(current_path).to eq("/podcasts")

    within "#podcast-1" do
      expect(page).to have_content(podcast_2.name)
    end

    within '#podcast-2' do
      expect(page).to have_content(podcast_1.name)
    end

    within '#podcast-3' do
      expect(page).to have_content(podcast_3.name)
    end

    within '#podcast-1-episode-count' do
      expect(page).to have_content("5")
    end

    within '#podcast-2-episode-count' do
      expect(page).to have_content("3")
    end

    within '#podcast-3-episode-count' do
      expect(page).to have_content("1")
    end

  end

  it 'has search box to find and return podcasts by with an exact string match to the search term' do
    podcast_1 = Podcast.create!(name: "This Canadian Death", in_production: true, ad_slot_cost: 950.25)
    podcast_2 = Podcast.create!(name: "The Hourly", in_production: true, ad_slot_cost: 500)
    podcast_3 = Podcast.create!(name: "100% Visible", in_production: true, ad_slot_cost: 875.69)
    podcast_4 = Podcast.create!(name: "Canadian-nomics", in_production: false, ad_slot_cost: 1400)
    podcast_5 = Podcast.create!(name: "HYPERSPORTS", in_production: false, ad_slot_cost: 999999)

    episode_1 = podcast_1.episodes.create!(title: "Tim Horton's Donut Distaster", length_in_seconds: 1000, marked_explicit: true)
    episode_2 = podcast_1.episodes.create!(title: "Hockey Pucks - A Public Health Crisis", length_in_seconds: 123, marked_explicit: false)
    episode_3 = podcast_1.episodes.create!(title: "Lost in Drake's Toronto Mansion", length_in_seconds: 10000, marked_explicit: true)

    episode_4 = podcast_2.episodes.create!(title: "Welcome to Our First Episode - Drake test", length_in_seconds: 2000, marked_explicit: true)
    episode_6 = podcast_2.episodes.create!(title: "This Production Schedule is Untenable", length_in_seconds: 20000, marked_explicit: true)

    # require 'pry'; binding.pry 

    visit "/podcasts"

    fill_in 'exact_match_search', with: "100% Visible"

    click_on 'Exact Title Search'

    expect(current_path).to eq("/podcasts")

    expect(page).to have_content(podcast_3.name)

    expect(page).to_not have_content(podcast_4.name)
    expect(page).to_not have_content(podcast_2.name)
    expect(page).to_not have_content(podcast_1.name)
    expect(page).to_not have_content(podcast_5.name)
  end

end