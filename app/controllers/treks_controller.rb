class TreksController < ApplicationController
  def index
    @treks = Trek.all
  end

  def show
    @trek = Trek.find(params[:id])
    @challenges = @trek.challenges
    @my_reports = Report.where(user: current_user, trek: @trek)
    @reports = Report.where(trek: @trek, public: true)
  end
end
