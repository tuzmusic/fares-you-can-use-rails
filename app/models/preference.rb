class Preference < ApplicationRecord
  belongs_to :user

  has_many :preference_regions
  has_many :regions, through: :preference_regions
  
  has_many :preference_home_airports
  has_many :home_airports, through: :preference_home_airports, source: :airport
  
  has_many :vacations
  accepts_nested_attributes_for :vacations
  
end

