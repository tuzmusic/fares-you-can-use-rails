class OriginAirport < ApplicationRecord
  belongs_to :airport
  belongs_to :deal
end
