class Preference < ApplicationRecord
  belongs_to :user
  has_many :preference_regions
  has_many :regions, through: :preference_regions
  has_many :preference_home_airports
  has_many :home_airports, through: :preference_home_airports, source: :airport
  
  has_many :preference_vacations, dependent: :destroy
  has_many :vacations, through: :preference_vacations

  accepts_nested_attributes_for :vacations
  
end

