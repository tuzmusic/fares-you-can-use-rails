require_relative './user/omniauth'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook]

  has_one :preferences, class_name: "Preference"
  has_many :vacations, through: :preferences
  has_many :home_airports, through: :preferences

  # has_many :regions, through: :preferences
  def regions
    self.preferences.regions  
  end

  after_create do |user|  
    user.preferences = Preference.create
  end

  def deals
    Deal.where
  end

  def full_name
    [first_name, last_name].join(" ") if first_name && last_name
  end
end
