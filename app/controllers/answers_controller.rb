class AnswersController < ApplicationController
  def create
    params[:answer][:question] = Question.find(params[:answer].delete(:question_id))
    params[:answer][:user] = current_user
    answer = Answer.create(params[:answer])
    if answer.valid?
      @comment = Comment.new
      render :json => render_to_string(:partial => 'answer', :locals => { :answer => answer, :@comment => @comment }).to_json
    else
      render :json => render_to_string(:partial => 'layouts/errors', :locals => { :bad_object => answer }), :status => :unprocessable_entity
    end
  end
end
