class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  has_many   :votes, as: :voteable

  attr_accessible :content, :user, :answer
  validates :content, presence: true

  default_scope order('created_at DESC')

  def vote_count 
    self.votes.inject(0) { |result, vote| result + vote.value}
  end
end
