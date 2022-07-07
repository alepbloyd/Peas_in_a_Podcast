require 'rails_helper'

RSpec.describe 'episode index', type: :feature do
# User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:

  it 'displays index of podcast episodes with attributes' do
    episode_1 = Episode.create!(title: "The first episode", length_in_seconds: 7000, marked_explicit: true)
    episode_2 = Episode.create!(title: "The second episode", length_in_seconds: 543, marked_explicit: false)
    episode_3 = Episode.create!(title: "The third episode", length_in_seconds: 25000, marked_explicit: true)

    visit "/episodes"

    expect(page).to have_content(episode_1.title)
    expect(page).to have_content(episode_1.length_in_seconds)
    expect(page).to have_content(episode_1.marked_explicit)

    expect(page).to have_content(episode_2.title)
    expect(page).to have_content(episode_2.length_in_seconds)
    expect(page).to have_content(episode_2.marked_explicit)

    expect(page).to have_content(episode_2.title)
    expect(page).to have_content(episode_2.length_in_seconds)
    expect(page).to have_content(episode_2.marked_explicit)
  end

end