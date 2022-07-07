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

end