require 'spec_helper'

describe Answer do
  let(:answer) { FactoryGirl.create(:answer) }
  let(:vote) { FactoryGirl.create(:vote) }
  let(:vote2) { FactoryGirl.create(:vote) }
  
  context "all the associations" do
    it { should belong_to(:question) }
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:votes) }
  end

  context "validations" do
    it "has a valid factory" do
      FactoryGirl.create(:answer).should be_valid
    end
    it "is invalid without a url" do
      FactoryGirl.build(:answer, url: nil).should_not be_valid
    end
  end

  context "model methods" do
    it "should retrieve the title of the product from the website"
    it "should retrieve a picture of the product from the website"
  end
  
  it "should return the answer's total vote count" do
    answer.votes << vote
    answer.votes << vote2
    total_votes = 0
    answer.votes.each do |vote|
      total_votes += vote.value
    end
    total_votes.should eq(2)    
  end
end



