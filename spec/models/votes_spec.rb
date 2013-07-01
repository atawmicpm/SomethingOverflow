require 'spec_helper'

describe Vote do 

	context "validations" do
		it "has a valid factory" do
			FactoryGirl.create(:vote).should be_valid
		end
	end

	context "all the associations" do
		it { should belong_to(:user) }
		it { should belong_to(:voteable) }
		it { should validate_uniqueness_of(:user_id).scoped_to(:voteable_id, :voteable_type) }
	end
end