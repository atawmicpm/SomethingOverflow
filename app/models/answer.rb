class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  # REVIEW: don't user question_id or *_id, try to use the name of the association.
  # so this line would be attr_accessible :url, :content, :question, :user
  # now when you mass assign: Answer.new :user => current_user, :question => @question.
  attr_accessible :url, :content, :question_id, :user_id

  # REVIEW: use validates :url, :presence => true, it's preferred.
  validates_presence_of :url
end
