class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments
  has_many :votes, as: :voteable
  before_save :answer_scraper

  # SHADI REVIEW: don't user question_id or *_id, try to use the name of the association.
  # so this line would be attr_accessible :url, :content, :question, :user
  # now when you mass assign: Answer.new :user => current_user, :question => @question.
  attr_accessible :url, :content, :question_id, :user_id

  validates :url, presence: true

  default_scope order('created_at DESC')

  def best?
    self.id == self.question.best_answer 
  end

  def vote_count 
    self.votes.inject(0) { |result, vote| result + vote.value}
  end

  def answer_scraper
    agent = Mechanize.new
    agent.get(self.url)
    self.picture_url = agent.page.search("#main-image").first.attributes['src'].value
    self.product_name = agent.page.search("h1").children[-2].text()
    # self.price =  
    # self.brand =
  end

end

