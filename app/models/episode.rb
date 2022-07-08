class Episode < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :length_in_seconds
  validates :marked_explicit, inclusion: [true,false]

  belongs_to :podcast
end