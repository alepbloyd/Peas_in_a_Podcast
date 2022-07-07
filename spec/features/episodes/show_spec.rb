require 'rails_helper'

RSpec.describe 'episode show', type: :feature do
# User Story 4, Child Show 

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:

  it 'shows the corresponding episode and attributes' do
    episode_1 = Episode.create!(title: "Criminal: The first episode", length_in_seconds: 1000, marked_explicit: true, podcast_id: 1)

    visit "/episodes/#{episode_1.id}"

    expect(page).to have_content(episode_1.title)
    expect(page).to have_content(episode_1.length_in_seconds)
    expect(page).to have_content(episode_1.marked_explicit)
  end

end