class Airport < ApplicationRecord
  has_many :deal_airports
  has_many :deals, through: :deal_airports
end
