class PreferenceSerializer < ActiveModel::Serializer
  attributes :id
  has_many :home_airports
  has_many :regions
  belongs_to :user
end
