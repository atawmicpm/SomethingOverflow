class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  attr_accessible :content

  validates_presence_of :content

end
