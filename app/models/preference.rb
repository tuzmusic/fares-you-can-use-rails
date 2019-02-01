class Preference < ApplicationRecord
  belongs_to :user
  has_many :preference_vacations
  has_many :vacations, through: :preference_vacations
  has_many :preference_regions
  has_many :regions, through: :preference_regions
end
