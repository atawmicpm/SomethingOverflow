require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.build(:user) }
  
  subject { user }
    it { should validate_presence_of :name}
    it { should validate_presence_of :email}
    it { should validate_presence_of :password}
    it { should validate_uniqueness_of :email}

  it "is invalid without a name" do
    expect(FactoryGirl.build(:user, name: nil)).to_not be_valid
  end

  it "is invalid without an email" do 
    expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
  end

  it "is invalid without a password" do
    expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
  end

  it "is valid with all fields" do
    expect(user).to be_valid
  end

  it "has a unique email" do
    user = FactoryGirl.build(:user, email: 'bob@bob.com')
    user.save
    user2 = FactoryGirl.build(:user, email: 'bob@bob.com')
    expect(user2.save).to eq false
  end
end
