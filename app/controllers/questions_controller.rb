# the canonical order of actions: index show new create edit update destroy
class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  # REVIEW: you are not assigning a user to that question, so the questions/show is broken.
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
    @answer = Answer.new
  end

  def index
    # REVIEW: isntead of using reverse, just set a default order in your question model.
    @questions = Question.all.reverse
  end
end
