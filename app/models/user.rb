class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :linkedin, :twitter, :google_oauth2]


  has_many :images, :as => :imageable

  accepts_nested_attributes_for :images

  def self.from_omniauth(auth)
    user = User.where(:provider => auth.try(:provider) || auth["provider"], :uid => auth.try(:uid) || auth["uid"]).first
    if user
      return user
    else
      registered_user = User.where(:provider=> auth.try(:provider) || auth["provider"], :uid=> auth.try(:uid) || auth["uid"]).first || User.where(:email=> auth.try(:info).try(:email) || auth["info"]["email"]).first
      if registered_user
        unless registered_user.provider == (auth.try(:provider) || auth["provider"]) && registered_user.uid == (auth.try(:uid) || auth["provider"])
          registered_user.update_attributes(:provider=> auth.try(:provider) || auth["provider"], :uid=> auth.try(:uid) || auth["uid"])
        end
        return registered_user
      else
        user = User.new(:provider => auth.try(:provider) || auth["provider"], :uid => auth.try(:uid) || auth["uid"])
        user.email = auth.try(:info).try(:email) || auth["info"]["email"]
        user.password = Devise.friendly_token[0,20]
        if (auth.try(:provider) || auth["provider"]) == "twitter"
          user.username = auth["info"]["nickname"]
        else
          user.username = auth.info.name
        end
        user.save
      end
      user
    end
  end

end
