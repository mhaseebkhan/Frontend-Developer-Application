class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email
  attr_accessible :password
  attr_accessible :password_confirmation
  attr_accessible :remember_me

end
