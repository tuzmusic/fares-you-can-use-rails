class Preference < ApplicationRecord
  belongs_to :user
  has_many :preference_vacations
  has_many :vacations, through: :preference_vacations
end
