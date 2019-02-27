class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :provider, :first_name, :last_name
  has_many :vacations
  has_many :home_airports
  has_many :regions
  has_one :preferences
end
