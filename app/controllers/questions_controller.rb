class QuestionsController < ApplicationController
  def index
    # SHADI REVIEW: isntead of using reverse, just set a default order in your question model.
    @questions = Question.all
  end

  def new
    if current_user
      @question = Question.new
    else
      redirect_to new_session_path
    end
  end

  def create
    @question = Question.new(params[:question])
    current_user.questions << @question

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

  def best
    answer = Answer.find(params[:answer])
    question = answer.question

    question.best_answer = answer.id
    question.save

    render partial: 'answers/best'
  end
end
