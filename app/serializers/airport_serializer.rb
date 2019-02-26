class AirportSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :country, :iata
end
