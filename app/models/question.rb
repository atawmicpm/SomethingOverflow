class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  attr_accessible :title, :content

  # REVIEW: you should add a validation for precense of user
  # also the preferred syntax is validates :title, :content, :presence => true
  validates_presence_of :title, :content

end
