class Episode < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :length_in_seconds
  validates :marked_explicit, inclusion: [true,false]

  belongs_to :podcast, counter_cache: true

  def self.only_display_explicit
    where(marked_explicit: true)
  end

  def self.alphabetical
    order(title: :asc)
  end

  def self.above_set_length(number)
    where("length_in_seconds > ?", number)
  end
  
end