require 'rails_helper'

RSpec.describe Podcast, type: :model do
  it {should have_many :episodes}
end