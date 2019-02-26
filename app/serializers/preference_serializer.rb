class PreferenceSerializer < ActiveModel::Serializer
  attributes :id
  has_many :home_airports
  belongs_to :user
end
