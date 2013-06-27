# REVIEW: minimize the pending tests.
require 'spec_helper'

describe UsersController do

  context 'new' do
    it 'should check if a user is already logged in'
    it 'should redirect to user page if user is already logged in'
    it 'should set a new user if a user is not logged in'
    it 'should render users#new'
  end

  context 'create' do
    it 'instantiates a user with form parameters'
  end

end
