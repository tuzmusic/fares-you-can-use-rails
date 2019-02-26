class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :provider, :first_name, :last_name
  has_one :preferences
end
