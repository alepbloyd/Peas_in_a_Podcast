require 'rails_helper'

RSpec.describe Podcast, type: :model do

  describe 'relationships' do
    it {should have_many :episodes}  
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :ad_slot_cost}
    it {should allow_value(true).for(:in_production) }
    it {should allow_value(false).for(:in_production) }
  end

  it 'returns "created_at" in "%a, %e %b %Y, %H:%M:%S" format' do
    podcast_1 = Podcast.create!(name: "This Canadian Death", in_production: true, ad_slot_cost: 950.25)

    podcast_1.update_attribute(:created_at, "2022-07-13 17:56:48.851122".to_datetime)

    expect(podcast_1.created_date_format).to eq("Wed, 13 Jul 2022, 17:56:48")
  end

  it 'returns "updated_at" in "%a, %e %b %Y, %H:%M:%S" format' do
    podcast_1 = Podcast.create!(name: "This Canadian Death", in_production: true, ad_slot_cost: 950.25)

    podcast_1.update_attribute(:updated_at, "2022-07-13 17:56:48.851122".to_datetime)

    expect(podcast_1.updated_date_format).to eq("Wed, 13 Jul 2022, 17:56:48")
  end

  it 'searches for exact matches based on search term' do
    podcast_1 = Podcast.create!(name: "This Canadian Death", in_production: true, ad_slot_cost: 950.25)
    podcast_2 = Podcast.create!(name: "This Canadian Life", in_production: true, ad_slot_cost: 950.25)
    podcast_3 = Podcast.create!(name: "This American Life", in_production: true, ad_slot_cost: 950.25)

    podcasts = [podcast_1,podcast_2,podcast_3]

    expect(Podcast.exact_match_search("This American Life")).to eq([podcast_3])
  end

  it 'searches for partial matches based on search term' do
    podcast_1 = Podcast.create!(name: "This Canadian Death", in_production: true, ad_slot_cost: 950.25)
    podcast_2 = Podcast.create!(name: "This Canadian Life", in_production: true, ad_slot_cost: 950.25)
    podcast_3 = Podcast.create!(name: "This American Life", in_production: true, ad_slot_cost: 950.25)

    podcasts = [podcast_1,podcast_2,podcast_3]

    expect(Podcast.partial_match_search("Life")).to eq([podcast_2,podcast_3])
  end

  it 'orders podcasts by recently created first' do
    podcast_1 = Podcast.create!(name: "This Canadian Death", in_production: true, ad_slot_cost: 950.25)
    podcast_2 = Podcast.create!(name: "This Canadian Life", in_production: true, ad_slot_cost: 950.25)
    podcast_3 = Podcast.create!(name: "This American Life", in_production: true, ad_slot_cost: 950.25)

    podcasts = [podcast_1,podcast_2,podcast_3]

    expect(Podcast.order_by_recently_created_first).to eq([podcast_3,podcast_2,podcast_1])
  end


  it 'orders podcasts by number of episodes' do
    podcast_1 = Podcast.create!(name: "This Canadian Death", in_production: true, ad_slot_cost: 950.25)


    podcast_2 = Podcast.create!(name: "This Canadian Life", in_production: true, ad_slot_cost: 950.25)

    episode_2_1 = podcast_2.episodes.create!(title: "test", marked_explicit: true, length_in_seconds: 14)
    episode_2_2 = podcast_2.episodes.create!(title: "test", marked_explicit: true, length_in_seconds: 14)
    episode_2_3 = podcast_2.episodes.create!(title: "test", marked_explicit: true, length_in_seconds: 14)


    podcast_3 = Podcast.create!(name: "This American Life", in_production: true, ad_slot_cost: 950.25)

    episode_3_1 = podcast_3.episodes.create!(title: "test", marked_explicit: true, length_in_seconds: 14)
    episode_3_2 = podcast_3.episodes.create!(title: "test", marked_explicit: true, length_in_seconds: 14)

    podcasts = [podcast_1,podcast_2,podcast_3]

    expect(Podcast.order_by_episode_count).to eq([podcast_2,podcast_3,podcast_1])
  end

end