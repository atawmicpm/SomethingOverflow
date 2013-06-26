class UsersController < ApplicationController

  def new
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      create_session(@user)
      redirect_to user_path(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    if params[:id] == current_user.id
      @user = current_user
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = current_user
    @user.assign_attributes(params[:user])
    if @user.save
      redirect_to user_path(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

  def index
    @users = User.all
  end
end
