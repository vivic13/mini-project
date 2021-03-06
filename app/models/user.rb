class User < ApplicationRecord
  extend FriendlyId
  friendly_id :nickname, use: :slugged
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  
  has_many :memberships
  has_many :plans, :through => :memberships

  has_many :likes
  has_many :plans, :through => :likes
  has_many :donations
  before_validation :set_nickname_default
  


  def self.from_omniauth(auth)
     # Case 1: Find existing user by facebook uid
     user = User.find_by_fb_uid( auth.uid )
     if user
        user.fb_token = auth.credentials.token
        #user.fb_raw_data = auth
        user.save!
       return user
     end

     # Case 2: Find existing user by email
     existing_user = User.find_by_email( auth.info.email )
     if existing_user
       existing_user.fb_uid = auth.uid
       existing_user.fb_token = auth.credentials.token
       #existing_user.fb_raw_data = auth
       existing_user.save!
       return existing_user
     end

     # Case 3: Create new password
     user = User.new
     user.fb_uid = auth.uid
     user.fb_token = auth.credentials.token
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     #user.fb_raw_data = auth
     user.save!
     return user
    end

    private

    def set_nickname_default
      self.nickname = self.email.split("@").first
    end

    


end
