class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  has_many   :votes, as: :voteable

  # SHADI REVIEW: don't user user_id or *_id, try to use the name of the association.
  # so this line would be attr_accessible :content, :user, :answer
  # now when you mass assign: Comment.new :user => current_user, :answer => @answer.  
  attr_accessible :content, :user_id, :answer_id
  validates :content, presence: true

  default_scope order('created_at DESC')

  def vote_count 
    self.votes.inject(0) { |result, vote| result + vote.value}
  end
end
