class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
    @entry = Entry.where(user: current_user, challenge: @challenge) if current_user
    @enrolled = true if @challenge.users.include?(current_user)
  end
end
