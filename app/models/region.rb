require_relative 'region/importing_utilities'

class Region < ApplicationRecord
  validates :name, uniqueness: true

  has_many :states
  has_many :deals
  has_many :airports

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
