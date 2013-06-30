class CommentsController < ApplicationController
  def create
    p params
    comment = Comment.new(content: params[:comment][:content])
    if comment.save
      current_user.comments << comment
      Answer.find(params[:comment][:answer_id]).comments << comment
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
