class Deal < ApplicationRecord
  has_many :airports # needs its own airports model
end
