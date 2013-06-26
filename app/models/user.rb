class User < ActiveRecord::Base

  attr_accessible :name, :email, :password, :password_confirmation

  has_secure_password

  validates :name, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true


end
