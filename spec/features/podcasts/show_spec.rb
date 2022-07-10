require 'rails_helper'

RSpec.describe 'podcast show', type: :feature do

  # User Story 2, Parent Show 

  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes:
  # - data from each column that is on the parent table

  it 'displays page of podcast attributes' do
    podcast_1 = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)

    visit "/podcasts/#{podcast_1.id}"
    
    expect(page).to have_content(podcast_1.name)
    expect(page).to have_content(podcast_1.in_production)
    expect(page).to have_content(podcast_1.ad_slot_cost)
  end

  # User Story 7, Parent Child Count

  # As a visitor
  # When I visit a parent's show page
  # I see a count of the number of children associated with this parent

  it 'displays count of episodes for each podcast' do
    podcast_1 = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)

    episode_1 = podcast_1.episodes.create!(title: "Criminal: The first episode", length_in_seconds: 1000, marked_explicit: true)
    episode_2 = podcast_1.episodes.create!(title: "Criminal: The second episode", length_in_seconds: 123, marked_explicit: false)
    episode_3 = podcast_1.episodes.create!(title: "Criminal: The third episode", length_in_seconds: 10000, marked_explicit: true)

    visit "/podcasts/#{podcast_1.id}"

    expect(page).to have_content(podcast_1.episodes.count)

  end

  it 'has link to delete the podcast' do
    podcast_1 = Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)

    episode_1 = podcast_1.episodes.create!(title: "C: EPISODE ONE", length_in_seconds: 1000, marked_explicit: true)
    episode_2 = podcast_1.episodes.create!(title: "C: EPISODE TWO", length_in_seconds: 123, marked_explicit: false)

    podcast_2 = Podcast.create!(name: "Snack Time", in_production: true, ad_slot_cost: 200)

    episode_3 = podcast_2.episodes.create!(title: "S: EPISODE ONE", length_in_seconds: 1000, marked_explicit: true)
    episode_4 = podcast_2.episodes.create!(title: "S: EPISODE TWO", length_in_seconds: 123, marked_explicit: true)

    visit "/podcasts/#{podcast_1.id}"

    click_link "Delete Podcast"

    expect(current_path).to eq("/podcasts")

    expect(page).to_not have_content("Criminal")

    visit "/episodes"

    save_and_open_page

    expect(page).to have_content("S: EPISODE ONE")
    expect(page).to have_content("S: EPISODE TWO")
    expect(page).to_not have_content("C: EPISODE ONE")
    expect(page).to_not have_content("C: EPISODE TWO")

  end

end