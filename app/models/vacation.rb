class Vacation < ApplicationRecord
  validates :name, presence: :true
  belongs_to :preference # must be singular here
  has_one :user, through: :preference

  def deals
    Deal.from_airports(self.user.home_airports)
      .to_regions(self.user.regions)
      .during_vacation self
  end
end
