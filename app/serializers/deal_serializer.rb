class DealSerializer < ActiveModel::Serializer
  attributes :id, :headline, :description, :start_date, :end_date, :links, :region_name, :slug
  has_many :origins
  has_many :destinations
end
