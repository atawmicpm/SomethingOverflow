class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments
  has_many :votes, as: :voteable
  
  before_save :answer_scraper

  attr_accessible :url, :content, :question, :user

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
    mech_objs = agent.page.search("h1").children
    self.product_name = mech_objs.length > 1 ? mech_objs[-2].text() : mech_objs.text()
  end
end
