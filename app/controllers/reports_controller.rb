class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :my_reports]

  def my_reports
    @reports = Report.where(user_id: current_user)
  end

  def show
    @report = Report.find(params[:id])
    unless @report.user == current_user || @report.public?
      redirect_to new_user_session_path, notice: "You are not authorized to view this trail report."
    end
  end

  def new
    @report = Report.new
  end

  def create
    # params[:report][:duration] = convert_to_seconds(params[:report][:duration])
    @report = Report.new(report_params)
    trek = Trek.find_by(id: params[:trek_id])
    @report.trek = trek
    @report.user = current_user
    if @report.save
      flash[:notice] = "Trail Report added successfully!"
      redirect_to trek_path(trek)
    else
      flash.now[:errors] = @report.errors.full_messages.join(". ")
      render :new
    end
  end

  private

  def report_params
    params[:report][:duration] = Report.convert_to_seconds(params[:report][:duration])
    params.require(:report).permit(
      :user, :trek, :start_date, :start_time,
      :end_date, :end_time, :duration, :distance, :weather,
      :conditions, :difficulty, :public, :report
    )
  end

  # def convert_to_seconds(str)
  #   hours = str.split(":").first.to_i
  #   minutes = str.split(":").last.to_i
  #   hours * 60 * 60 + minutes * 60
  # end
end
