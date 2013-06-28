class User < ActiveRecord::Base
  has_many :questions
  has_many :votes
  has_many :answers
  has_many :comments

  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email
end
