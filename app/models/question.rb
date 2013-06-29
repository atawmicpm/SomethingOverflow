class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers


  attr_accessible :title, :content, :user

  validates :title, :content, presence: true

  default_scope order('created_at DESC')


end
