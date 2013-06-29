class AnswersController < ApplicationController
  def create
    @answer = Answer.new(params[:answer])
    @comment = Comment.new
    if @answer.save
      render :json => render_to_string(:partial => 'answer', :locals => { :answer => @answer, :@comment => @comment }).to_json
    else
      render :json => render_to_string(:partial => 'layouts/errors', :locals => { :bad_object => @answer }), :status => :unprocessable_entity
    end
  end
end
