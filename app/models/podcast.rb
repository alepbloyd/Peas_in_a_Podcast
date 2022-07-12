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

end