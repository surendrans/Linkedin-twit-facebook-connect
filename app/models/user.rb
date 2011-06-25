class User < ActiveRecord::Base
  has_many :authentications  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable,  :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  #, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def apply_omniauth(omniauth)
    p "====================================="
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'] )
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end  
end
