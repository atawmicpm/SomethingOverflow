class VotesController < ApplicationController
  
  def vote_count(voteable_type, voteable_id)
    eval(voteable_type).find(voteable_id).vote_count
  end

  def create
    vote = Vote.create(params[:vote])
    current_user.votes << vote

    render :json => { vote_id: vote.id, vote_count: vote_count(params[:vote][:voteable_type], params[:vote][:voteable_id]) }
  end

  def update
    vote = Vote.find(params[:id])
    vote.update_attributes(params[:vote])

    render :json => { vote_count: vote_count(params[:vote][:voteable_type], params[:vote][:voteable_id]) }
  end
end
