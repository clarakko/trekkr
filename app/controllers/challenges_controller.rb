class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])

    if current_user
      @entry = Entry.find_by(user: current_user, challenge: @challenge)
      @enrolled = true if @challenge.users.include?(current_user)
    end
  end
end
