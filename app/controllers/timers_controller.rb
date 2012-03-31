class TimersController < ApplicationController
  def update
    @timer = current_user.timers.find(params[:id])
    @timer.toggle
    respond_with(@timer)
  end
  def show
    @timer = current_user.timers.find(params[:id])
  end
end
