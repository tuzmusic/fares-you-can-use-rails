require_relative 'region/importing_utilities'

class Region < ApplicationRecord
  validates :name, uniqueness: true

  has_many :states
  has_many :deals
  has_many :airports

  has_many :preference_regions
  has_many :preferences, through: :preference_regions

  scope :by_most_deals, -> { left_joins(:deals).group(:id).order(Arel.sql('COUNT(deals.id) DESC')) }
  # scope :by_most_deals, -> { joins(:deals).group("regions.id").order("count(regions.id) DESC") }

  include Slugifiable::InstanceMethods
  after_create do |r|
    r.update(slug: slug_for(r.name))
  end

  def to_param
    slug
  end

  def set_slug
    update(slug: slug_for(name))
  end

  def self.set_all_slugs
    where(slug:nil).map(&:set_slug)
  end
end
