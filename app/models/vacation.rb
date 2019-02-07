class Vacation < ApplicationRecord
  validates :name, presence: :true
  belongs_to :preference # must be singular here

  def deals
    Deal.where.not('start_date >= ?', end_date).where.not('end_date <= ?', start_date)
  end
end
