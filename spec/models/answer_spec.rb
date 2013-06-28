require 'spec_helper'

describe Answer do
  let(:answer) { Answer.create(url: "www.google.com") }
  context "#current_vote_count" do
    before do
      2.times do
        Vote.create(value: 1, votable_id: answer.id, votable_type: Answer::VOTABLE_TYPE)
      end
    end

    it "should return the total vote count" do
      answer.current_vote_count.should eq(2)
    end

    it "should not count votes for comments" do
      Vote.create(value: 1, votable_id: answer.id, votable_type: Comment::VOTABLE_TYPE)
      answer.current_vote_count.should eq(2)
    end

  end

end
