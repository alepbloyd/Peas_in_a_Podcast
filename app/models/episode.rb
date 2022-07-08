class Episode < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :length_in_seconds
  validates :marked_explicit, inclusion: [true,false]

  belongs_to :podcast

  def self.only_display_explicit
    where(marked_explicit: true)
  end
end