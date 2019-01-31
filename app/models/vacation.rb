class Vacation < ApplicationRecord
  belongs_to :user

  def deals
    Deal.where.not('start_date >= ?', end_date).where.not('end_date <= ?', start_date)
  end
end
