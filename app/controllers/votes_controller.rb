class VotesController < ApplicationController
  def up
    change(1)
  end

  def down
    change(-1)
  end

  def change(value)
    answer = Answer.find(params[:votable_id])
    vote = Vote.new :value => value, :votable_id => answer.id, votable_type: Answer::VOTABLE_TYPE,
     :user => current_user

    if vote.save
      render json: { answer_id: params[:votable_id], vote_count: answer.current_vote_count }
    end
  end
end
