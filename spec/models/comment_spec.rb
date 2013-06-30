require 'spec_helper'

describe Comment do 
	let(:vote) { FactoryGirl.create(:vote) }
	let(:vote2) { FactoryGirl.create(:vote) }
	let(:comment) { FactoryGirl.create(:comment) }

	context "validations" do
		it "has a valid factory" do
			FactoryGirl.create(:comment).should be_valid
		end
		it "is invalid without content" do
			FactoryGirl.build(:comment, content: nil).should_not be_valid
		end
	end

	context "all the associations" do
		it { should belong_to(:user) }
		it { should belong_to(:answer) }
		it { should have_many(:votes) }
	end

	context "model methods" do
		it "should return the total votes for the current comment" do
			comment.votes << vote
			comment.votes << vote2
			total_votes = 0
			comment.votes.each do |vote|
				total_votes += vote.value
			end
			total_votes.should eq(2)
		end
	end
end
