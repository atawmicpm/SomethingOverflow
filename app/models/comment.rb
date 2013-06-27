class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  has_many   :votes, :as => :votable

  attr_accessible :content, :user_id, :answer_id
end
