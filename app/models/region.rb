class Region < ApplicationRecord
  validates :name, uniqueness: true

  has_many :states
  has_many :deals
  has_many :airports

  def state_names=(comma_separated_string)
    states = comma_separated_string.split(", ")
    states.each do |state|
      self.states << State.find_by(name:state) if State.find_by(name:state)
    end
  end
end
