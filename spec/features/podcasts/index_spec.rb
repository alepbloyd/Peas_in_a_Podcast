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

    within '#podcast_info_container' do
      expect(page.all('.podcast_name')[0]).to have_content("This American Life")
      expect(page.all('.podcast_name')[1]).to have_content("The Daily")
      expect(page.all('.podcast_name')[2]).to have_content("Maintenance Phase")
      expect(page.all('.podcast_name')[3]).to have_content("Criminal")
    end
    
  end

end