class User < ActiveRecord::Base
  has_many :questions
  has_many :votes
  has_many :answers
  has_many :comments

  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  validates :name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true

  def find_vote(voteable)
    self.votes.find_by_voteable_id_and_voteable_type(voteable.id, voteable.class.name)
  end

  def vote_value(voteable)
    vote = find_vote(voteable)
    vote ? vote.value : 0
  end

  def vote_id(voteable)
    vote = find_vote(voteable)
    vote ? vote.id : 0
  end
end
