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

    allow(podcast_1).to receive(:created_date_format).and_return('Tue, 12 Jul 2022, 06:46:39')

    expect(podcast_1.created_date_format).to eq("Tue, 12 Jul 2022, 06:46:39")
  end

  it 'returns "updated_at" in "%a, %e %b %Y, %H:%M:%S" format' do
    podcast_1 = Podcast.create!(name: "This Canadian Death", in_production: true, ad_slot_cost: 950.25)

    allow(podcast_1).to receive(:updated_date_format).and_return('Tue, 12 Jul 2022, 06:46:39')

    expect(podcast_1.updated_date_format).to eq("Tue, 12 Jul 2022, 06:46:39")
  end

end