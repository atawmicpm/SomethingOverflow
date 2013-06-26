class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  attr_accessible :title, :content

  validates_presence_of :title, :content

end
