class Region < ApplicationRecord
  validates :name, uniqueness: true

  has_many :states
  has_many :deals
  has_many :airports

  include Slugifiable::InstanceMethods
  after_create do |r|
    r.update(slug: slug_for(r.name))
  end

  def state_names=(comma_separated_string)
    states = comma_separated_string.split(", ")
    states.each do |state|
      self.states << State.find_by(name:state) if State.find_by(name:state)
    end
  end

  def set_slug
    update(slug: slug_for(name))
  end

  def self.set_all_slugs
    where(slug:nil).map(&:set_slug)
  end
end
