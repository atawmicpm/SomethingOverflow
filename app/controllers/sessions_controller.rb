class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      create_session(user)
      redirect_to user_path(user)
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
