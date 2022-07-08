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
end