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

end