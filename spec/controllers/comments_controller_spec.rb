require 'spec_helper'

describe CommentsController do

	let(:user) { FactoryGirl.create(:user) }
	let(:answer) { FactoryGirl.create(:answer) }
	let(:comment) { FactoryGirl.create(:comment) }
	let(:comment_attributes) { FactoryGirl.attributes_for(:comment) }
	let(:invalid_comment) { FactoryGirl.create(:invalid_comment) }
	let(:invalid_comment_attributes) { FactoryGirl.attributes_for(:invalid_comment) }
	
	before do 
		user 
		answer
		comment
		session[:user_id] = user.id
		comment_attributes[:answer_id] = answer.id
	end

	context "with valid attributes" do
		it "creates a new comment" do
			expect {
				post :create, comment: comment_attributes
			}.to change(Comment, :count).by(1)
		end
		it "adds the comment to the answer" do 
			expect {
				post :create, comment: comment_attributes
				answer.comments.last.id eq(comment.id) 
			}
		end
		it "adds the comment to the user" do
			expect {
				post :create, comment: comment_attributes
	  		user.comments.last.id eq(comment.id)
	  	}
		end
	end

	context "with invalid attributes" do
		it "does not save the new comment" do
			invalid_comment_attributes[:answer_id] = answer.id

			expect {
				post :create, comment: invalid_comment_attributes 
			}.to_not change(Comment, :count)
		end
		it "does not add the comment to the answer" do 
			expect {
				post :create, comment: invalid_comment_attributes
				answer.comments.last.id.should_not eq(comment.id) 
			}
		end
		it "does not add the comment to the user" do
			expect {
				post :create, comment: invalid_comment_attributes
	  		user.comments.last.id.should_not eq(comment.id)
	  	}
		end
	end

end

