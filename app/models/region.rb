class Region < ApplicationRecord
  validates :name, uniqueness: true

  has_many :states
end
