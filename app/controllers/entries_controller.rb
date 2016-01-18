class EntriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :destroy]

  def index
    @user = User.find(params[:user_id])
    @entries = @user.challenges
  end

  def create
    @entry = Entry.new
    @entry.challenge = Challenge.find_by(id: params[:id])
    @entry.user = current_user
    if @entry.save
      flash[:notice] = "Challenge joined!"
      redirect_to challenge_path(@entry.challenge)
    else
      flash[:notice] = "Oops!"
      render challenge_path(@entry.challenge)
    end
  end

  def destroy
    challenge = Challenge.find(params[:id])
    entry = Entry.find_by(challenge: challenge, user: current_user)
    entry.destroy

    redirect_to challenge_path(challenge), notice: "You are no longer tracking this challenge."
  end
end
