class CommentsController < ApplicationController
  def create
    params[:comment][:answer] = Answer.find(params[:comment].delete(:answer_id))
    params[:comment][:user] = current_user
    comment = Comment.create(params[:comment])
    if comment.valid?
      render :json => render_to_string(:partial => 'comment', :locals => { :comment => comment }).to_json
    else
      render :json => render_to_string(:partial => 'layouts/errors', :locals => { :bad_object => comment }), :status => :unprocessable_entity
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
