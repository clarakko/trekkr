class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
    count = @challenge.treks.count
    half = count / 2
    @treks_first = @challenge.treks[0...half]
    @treks_last = @challenge.treks[half..-1]

    if current_user
      @entry = Entry.find_by(user: current_user, challenge: @challenge)
      @enrolled = true if @challenge.users.include?(current_user)
    end
  end
end
