class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments
  has_many :votes, :as => :votable

  attr_accessible :url, :content, :question_id, :user_id

  validates_presence_of :url

  VOTABLE_TYPE = self.to_s

  def current_vote_count
    Vote.where(votable_id: self.id, votable_type: VOTABLE_TYPE).sum("value")
  end
end
