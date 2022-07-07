require 'rails_helper'

RSpec.describe Episode, type: :model do
  it {should belong_to :podcast}
end