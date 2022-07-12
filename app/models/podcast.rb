class Podcast < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :ad_slot_cost
  validates :in_production, inclusion: [true,false]

  has_many :episodes, :dependent => :destroy

  def self.order_by_recently_created_first
    order(created_at: :desc)
  end

  def self.order_by_episode_count
    order(episodes_count: :desc)
  end

  def created_date_format
    self.created_at.strftime("%a, %e %b %Y, %H:%M:%S")
  end

  def updated_date_format
    self.updated_at.strftime("%a, %e %b %Y, %H:%M:%S")
  end

end