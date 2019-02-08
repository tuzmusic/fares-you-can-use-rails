class Favorite < ApplicationRecord
  belongs_to :preference
  belongs_to :deal
end
