class Link < ApplicationRecord
  belongs_to :deal

  validates :text, presence: :true
  validates :url, presence: :true
end
