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

end