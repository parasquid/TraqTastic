class TimersController < ApplicationController
  def update
    @timer = current_user.timers.find(params[:id])
    @timer.toggle
    respond_with(@timer)
  end
  def show
    @timer = current_user.timers.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end
end
