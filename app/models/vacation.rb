class Vacation < ApplicationRecord
  has_many :preference_vacations
  has_many :preferences, through: :preference_vacations, dependent: :destroy

  def deals
    Deal.where.not('start_date >= ?', end_date).where.not('end_date <= ?', start_date)
  end
end
