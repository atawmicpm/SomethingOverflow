class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  attr_accessible :title, :content, :user, :answer, :best_answer
  validates :title, :content, presence: true
  default_scope order('created_at DESC')

  def owner?(current_user)
  	current_user.id == self.user_id
  end

  def sorted_answers
    answers = self.answers.sort!{ |a,b| b.vote_count <=> a.vote_count }
    return answers if self.best_answer.nil?
    answers.partition { |answer| answer.id == self.best_answer }.flatten
  end

 end
