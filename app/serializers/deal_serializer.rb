class DealSerializer < ActiveModel::Serializer
  attributes :id, :headline, :description, :start_date, :end_date, :links
  belongs_to :region
  has_many :origins
  has_many :destinations
end
