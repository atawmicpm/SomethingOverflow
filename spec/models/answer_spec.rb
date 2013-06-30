require 'spec_helper'

describe Answer do
  let(:answer) { Answer.create(url: "http://www.amazon.com/Gund-Philbin-18-Bear-Beige/dp/B0041Q3UME/ref=sr_1_6?ie=UTF8&qid=1372561939&sr=8-6&keywords=teddy") }
  context "#current_vote_count" do
    before do
      2.times do
        Vote.create(value: 1, votable_id: answer.id, votable_type: Answer::VOTEABLE_TYPE)
      end
    end

    it "should return the total vote count" do
      answer.current_vote_count.should eq(2)
    end

    it "should not count votes for comments" do
      Vote.create(value: 1, votable_id: answer.id, votable_type: Comment::VOTEABLE_TYPE)
      answer.current_vote_count.should eq(2)
    end

  end

end
