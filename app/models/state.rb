class State < ApplicationRecord
  validates :name, uniqueness: true
  
  has_many :airports
  belongs_to :region, optional: true
end
