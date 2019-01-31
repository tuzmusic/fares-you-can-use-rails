require_relative './user/omniauth'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook]

  has_many :vacations
  has_one :preference

  def full_name
    [first_name, last_name].join(" ") if first_name && last_name
  end

  
end
