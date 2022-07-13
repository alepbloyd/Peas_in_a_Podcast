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

  def self.exact_match_search(term)
    where(title: term)
  end
  
  def time_format
    starting_seconds = self.length_in_seconds

    remaining_seconds = starting_seconds

    hours = (starting_seconds / 3600)

    remaining_seconds = (starting_seconds % 3600)

    minutes = (remaining_seconds / 60)

    seconds = (remaining_seconds % 60)
    
    if hours == 0
      hours_string = ""
    elsif hours == 1
      hours_string = "1 Hour, "
    else
      hours_string = "#{hours} Hours, "
    end

    if minutes == 0
      minutes_string = ""
    elsif minutes == 1
      minutes_string = "1 Minute, "
    else
      minutes_string = "#{minutes} Minutes, "
    end

    if seconds == 0
      seconds_string = ""
    elsif seconds == 1
      seconds_string = "1 Second"
    else
      seconds_string = "#{seconds} Seconds"
    end

    "#{hours_string}#{minutes_string}#{seconds_string}".chomp(", ")

  end

end