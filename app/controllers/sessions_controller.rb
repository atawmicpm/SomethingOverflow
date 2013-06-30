class SessionsController < ApplicationController
  before_filter :store_return_to, :only => [:new]

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email]) 
    if user && user.authenticate(params[:session][:password])
      create_session(user)
      redirect_back_or_default user
    else
      flash.now[:errors] = ["Wrong username or password"]
      render :new
    end
  end

  def destroy 
    session.clear
    redirect_to root_path
  end
end
