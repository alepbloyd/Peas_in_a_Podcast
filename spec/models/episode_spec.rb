require 'rails_helper'

RSpec.describe Episode, type: :model do
  describe 'relationships' do
    it {should belong_to :podcast}
  end

  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :length_in_seconds}
    it {should allow_value(true).for(:marked_explicit) }
    it {should allow_value(false).for(:marked_explicit) }
  end

  it 'returns time formatted as hours, minutes, seconds' do
    podcast_1 = Podcast.create!(name: "This Canadian Death", in_production: true, ad_slot_cost: 950.25)
    
    episode_1 = podcast_1.episodes.create!(title: "Tim Horton's Donut Distaster", length_in_seconds: 5000, marked_explicit: true)

    episode_2 = podcast_1.episodes.create!(title: "Test2", length_in_seconds: 65, marked_explicit: true)
    
    episode_3 = podcast_1.episodes.create!(title: "Test3", length_in_seconds: 121, marked_explicit: true)

    episode_4 = podcast_1.episodes.create!(title: "Test4", length_in_seconds: 30000, marked_explicit: true)

    episode_5 = podcast_1.episodes.create!(title: "Test5", length_in_seconds: 60, marked_explicit: true)

    episode_6 = podcast_1.episodes.create!(title: "Test6", length_in_seconds: 3600, marked_explicit: true)

    expect(episode_1.time_format).to eq("1 Hour, 23 Minutes, 20 Seconds")
    expect(episode_2.time_format).to eq("1 Minute, 5 Seconds")
    expect(episode_3.time_format).to eq("2 Minutes, 1 Second")
    expect(episode_4.time_format).to eq("8 Hours, 20 Minutes")
    expect(episode_5.time_format).to eq("1 Minute")
    expect(episode_6.time_format).to eq("1 Hour")

  end
end