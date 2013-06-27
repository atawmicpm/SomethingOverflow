class AnswersController < ApplicationController
  
  def create
    @answer = Answer.new(params[:answer])
    if @answer.save
      render :json => render_to_string(:partial => 'answer', :locals => { :answer => @answer }).to_json
    else
      render :json => render_to_string(:partial => 'answer_errors', :locals => { :answer => @answer }), :status => :unprocessable_entity
    end
  end
end
