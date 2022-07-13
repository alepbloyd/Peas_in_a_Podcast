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

  it 'only displays episodes where :marked_explicit is true' do
    podcast_1 = Podcast.create!(name: "This Canadian Death", in_production: true, ad_slot_cost: 950.25)
    
    episode_1 = podcast_1.episodes.create!(title: "Tim Horton's Donut Distaster", length_in_seconds: 5000, marked_explicit: true)

    episode_2 = podcast_1.episodes.create!(title: "Test2", length_in_seconds: 65, marked_explicit: false)
    
    episode_3 = podcast_1.episodes.create!(title: "Test3", length_in_seconds: 121, marked_explicit: true)

    episode_4 = podcast_1.episodes.create!(title: "Test4", length_in_seconds: 30000, marked_explicit: true)

    expect(Episode.only_display_explicit).to eq([episode_1,episode_3,episode_4])
  end

  it 'sorts episodes alphabetically' do
    podcast_1 = Podcast.create!(name: "This Canadian Death", in_production: true, ad_slot_cost: 950.25)
    
    episode_1 = podcast_1.episodes.create!(title: "B", length_in_seconds: 5000, marked_explicit: true)

    episode_2 = podcast_1.episodes.create!(title: "A", length_in_seconds: 65, marked_explicit: false)
    
    episode_3 = podcast_1.episodes.create!(title: "D", length_in_seconds: 121, marked_explicit: true)

    episode_4 = podcast_1.episodes.create!(title: "C", length_in_seconds: 30000, marked_explicit: true)

    expect(Episode.alphabetical).to eq([episode_2,episode_1,episode_4,episode_3])
  end

  it 'displays episodes above given length' do
    podcast_1 = Podcast.create!(name: "This Canadian Death", in_production: true, ad_slot_cost: 950.25)

    episode_1 = podcast_1.episodes.create!(title: "B", length_in_seconds: 10, marked_explicit: true)

    episode_2 = podcast_1.episodes.create!(title: "A", length_in_seconds: 20, marked_explicit: false)
    
    episode_3 = podcast_1.episodes.create!(title: "D", length_in_seconds: 30, marked_explicit: true)

    episode_4 = podcast_1.episodes.create!(title: "C", length_in_seconds: 40, marked_explicit: true)

    expect(Episode.above_set_length(25)).to eq([episode_3,episode_4])
  end

  it 'searches for exact matches based on search term' do
    podcast_1 = Podcast.create!(name: "This Canadian Death", in_production: true, ad_slot_cost: 950.25)

    episode_1 = podcast_1.episodes.create!(title: "B TEST", length_in_seconds: 10, marked_explicit: true)

    episode_2 = podcast_1.episodes.create!(title: "A TEST", length_in_seconds: 20, marked_explicit: false)
    
    episode_3 = podcast_1.episodes.create!(title: "D TEST", length_in_seconds: 30, marked_explicit: true)

    episode_4 = podcast_1.episodes.create!(title: "C TEST", length_in_seconds: 40, marked_explicit: true)

    expect(Episode.exact_match_search("D TEST")).to eq([episode_3])
  end
end