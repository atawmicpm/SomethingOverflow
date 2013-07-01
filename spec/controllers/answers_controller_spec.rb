require 'spec_helper'

describe AnswersController do

	let(:user) { FactoryGirl.create(:user) }
	let(:answer) { FactoryGirl.create(:answer) }
	let(:question) { FactoryGirl.create(:question) }
	let(:answer_attributes) { FactoryGirl.attributes_for(:answer) }
	let(:invalid_answer) { FactoryGirl.create(:invalid_answer) }
	let(:invalid_answer_attributes) { FactoryGirl.attributes_for(:invalid_answer) }
	let(:answer_duplicate) { FactoryGirl.attributes_for(:answer_duplicate) }
	let(:answer_duplicate_attributes) { FactoryGirl.attributes_for(:answer_duplicate) }
	
	before do 
		user 
		question
		answer
		session[:user_id] = user.id
	end

	context "with valid attributes" do
		it "creates a new answer" do
			answer_attributes[:question_id] = question.id
			
			expect {
				post :create, answer: answer_attributes
			}.to change(Answer, :count).by(1)
		end

		it "returns a product name" do
			answer.product_name.should eq("Ty Beanie Boos Julep Pink Monkey with Heart")
		end

		it "returns a product picture url" do
			answer.picture_url.should eq("http://ecx.images-amazon.com/images/I/51HFiTIHZTL._SY300_.jpg")
		end

		it "renders the answers partial if the answer is valid"
		it "render the errors partial is the answer is invalid"
	end

	context "with invalid attributes" do
		it "does not save the new answer" do
			invalid_answer_attributes[:question_id] = question.id

			expect {
				post :create, answer: invalid_answer_attributes 
			}.to_not change(Answer, :count)
		end
	end

end
