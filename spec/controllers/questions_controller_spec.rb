require 'spec_helper'

describe QuestionsController do

	let(:user) { FactoryGirl.create(:user) }
	let(:question) { FactoryGirl.create(:question) }
	let(:question_attributes) { FactoryGirl.create(:question) }
	let(:invalid_question) { FactoryGirl.create(:invalid_question) }
	let(:invalid_question_attributes) { FactoryGirl.create(:invalid_question) }
	
	before do 
		user 
		question
		session[:user_id] = user.id
	end

	context "with valid attributes" do
		it "creates a new question" do
			# question_attributes[:user_id] = user.id

			expect {
				post :create, question: question_attributes
			}.to change(Question, :count).by(1)
		end
	end

	context "with invalid attributes" do
		it "does not save the new question" do
			# invalid_question_attributes[:user_id] = user.id

			expect {
				post :create, question: invalid_question_attributes 
			}.to_not change(Question, :count)
		end
	end

end
























