class DealSerializer < ActiveModel::Serializer
  attributes :id, :headline, :description, :start_date, :end_date, :region_name, :slug, :posted_date
  has_many :origins
  has_many :destinations
  has_many :links
end
