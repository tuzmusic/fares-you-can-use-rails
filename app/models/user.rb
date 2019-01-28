class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         devise :omniauthable, omniauth_providers: %i[facebook]


  def self.from_omniauth(auth)
    if user = User.find_by(email: auth.info.email)
      user.provider    ||= auth.provider
      user.uid         ||= auth.uid
      user.first_name  ||= auth.info.first_name   
      user.last_name   ||= auth.info.last_name   
      commented_stuff_for_omniauth(user)
      user.save
      user
    elsif user = User.create(provider: auth.provider, uid: auth.uid)
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name   
      user.last_name = auth.info.last_name   
      commented_stuff_for_omniauth(user)
      user.save 
      user
    end
  end
         
  def self.commented_stuff_for_omniauth(user)
    # user.image = auth.info.image 
    # If you are using confirmable and the provider(s) you use validate emails, 
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
  
end
