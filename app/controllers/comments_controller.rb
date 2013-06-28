class CommentsController < ApplicationController

  def create
    comment = Comment.create(content: params[:content])
    current_user.comments << comment
    Answer.find(params[:answer_id]).comments << comment
    redirect_to :back
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
