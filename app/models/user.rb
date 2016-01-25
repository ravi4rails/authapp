class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :linkedin, :twitter, :google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      if auth.provider == "twitter"
        user.username = auth.info.nickname
        user.first_name = auth.info.name.split(" ")[0]
        user.last_name = auth.info.name.split(" ")[1]
      else
        user.username = auth.info.name
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
      end
      user.save!
    end
  end
end
