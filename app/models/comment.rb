class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  has_many   :votes, :as => :votable

  attr_accessible :content, :user_id, :answer_id

  VOTABLE_TYPE = self.to_s

  def current_vote_count
    Vote.where(votable_id: self.id, votable_type: VOTABLE_TYPE).sum("value")
  end
end
