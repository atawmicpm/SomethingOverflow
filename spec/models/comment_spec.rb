require 'spec_helper'

describe Comment do 
	it { should belong_to(:user) }
	it { should belong_to(:answer) }
	it { should have_many(:votes) }
end