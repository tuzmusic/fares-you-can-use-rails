class Favorite < ApplicationRecord
  belongs_to :preference
  belongs_to :deal

  def self.for_deal(deal, user)
    where(deal_id: deal.id, preference_id: user.preferences.id).first
  end
end
