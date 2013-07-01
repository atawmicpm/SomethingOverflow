require 'spec_helper'

describe Question do 
	let(:question) { FactoryGirl.create(:question) }
	let(:user) { FactoryGirl.create(:user) }

	before do
		question
		user
	end

	context "validations" do
		it "has a valid factory" do
			FactoryGirl.create(:comment).should be_valid
		end
	end

	context "all the associations" do
		it { should belong_to(:user) }
		it { should have_many(:answers) }
		it { should validate_presence_of :content}
		it { should validate_presence_of :title}
	end

	context "question model methods" do
		describe "question#owner?" do
			it "should return true if the current user created the question" do
				expect { question.user?(user) }.to be_true
			end

			it "should return false if the current user did not create the question"
				
		end
	end
end