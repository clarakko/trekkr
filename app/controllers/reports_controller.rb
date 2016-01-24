class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [
    :index, :new, :create, :update, :my_reports]

  def my_reports
    @reports = Report.where(user_id: current_user)
  end

  def show
    @report = Report.find(params[:id])
    unless @report.user == current_user || @report.public?
      redirect_to new_user_session_path, notice: "You are not authorized
      to view this trail report."
    end
  end

  def new
    @report = Report.new
  end

  def create
    trek = Trek.find_by(id: params[:trek_id])
    @report = Report.new(report_params)
    @report.trek = trek
    @report.user = current_user
    @report.duration_s = Report.convert_to_seconds(@report.duration)
    if @report.save
      flash[:notice] = "Trail Report added successfully!"
      redirect_to trek
    else
      flash.now[:errors] = @report.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @report = Report.find(params[:id])
    @trek = @report.trek
  end

  def update
    @report = Report.find(params[:id])
    @trek = @report.trek
    @report.update(report_params)
    @report.duration_s = Report.convert_to_seconds(@report.duration)

    if @report.save
      flash[:notice] = 'Trail report updated successfully'
      redirect_to trek_path(@report.trek)
    else
      flash.now[:error] = @report.errors.full_messages.join(". ")
      render :edit
    end
  end

  private

  def report_params
    params.require(:report).permit(
      :user, :trek, :start_date, :start_time,
      :end_date, :end_time, :duration, :distance, :weather,
      :conditions, :difficulty, :public, :report
    )
  end
end
