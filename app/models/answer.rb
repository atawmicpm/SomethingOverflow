class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments
  has_many :votes, :as => :votable

  attr_accessible :url, :content, :question_id, :user_id

  validates_presence_of :url
end
