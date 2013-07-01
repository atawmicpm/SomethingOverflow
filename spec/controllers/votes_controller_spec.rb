require 'spec_helper'

describe VotesController do

	let(:user) { FactoryGirl.create(:user) }
	let(:vote) { FactoryGirl.create(:vote) }
	let(:voteable_id) { FactoryGirl.create(:invalid_vote) }
	let(:voteable_type) { FactoryGirl.create(:invalid_vote) }
	let(:comment) { FactoryGirl.create(:comment) }
	let(:vote_attributes) { FactoryGirl.attributes_for(:vote) }
	let(:invalid_vote) { FactoryGirl.create(:invalid_vote) }
	let(:invalid_vote_attributes) { FactoryGirl.attributes_for(:invalid_vote) }
	let(:updated_vote) { FactoryGirl.create(:updated_vote) }
	let(:updated_vote_attributes) { FactoryGirl.attributes_for(:updated_vote) }
	
	before do 
		vote
		comment
		user 
		session[:user_id] = user.id
	end

	context "with valid attributes" do
		it "creates a new vote" do
			vote_attributes[:voteable_id] = comment.id

			expect {
				post :create, vote: vote_attributes
			}.to change(Vote, :count).by(1)
		end
		it "subracts two from the vote count"
		it "adds two to the vote count"
	end

	context "with invalid attributes" do
		it "does not save the new vote" do
			invalid_vote_attributes[:voteable_id] = comment.id

			expect {
				post :create, vote: invalid_vote_attributes 
			}.to_not change(Vote, :count)
		end
	end
end


