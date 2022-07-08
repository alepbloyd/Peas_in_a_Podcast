class Podcast < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :ad_slot_cost
  validates :in_production, inclusion: [true,false]

  has_many :episodes

  def self.order_by_recently_created_first
    order(created_at: :desc)
  end
end