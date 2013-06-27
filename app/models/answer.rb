class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  attr_accessible :url, :content, :question_id, :user_id

  validates_presence_of :url
end
