class Deal < ApplicationRecord
  has_many :deal_airports
  has_many :airports, through: :deal_airports  
end
