class ReportsController < ApplicationController
  def index
    @reports = current_user.reports.all
  end

  def show
    @report = current_user.reports.find params[:id]
  end
end
