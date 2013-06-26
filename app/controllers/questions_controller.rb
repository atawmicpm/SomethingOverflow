class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      redirect_to @question
    else
      flash.now[:errors] = @question.errors.full_messages
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all.reverse
  end
end
