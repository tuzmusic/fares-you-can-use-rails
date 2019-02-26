class AirportSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :country, :iata
  has_many :origin_deals
  has_many :destination_deals
end
