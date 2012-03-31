class TimersController < ApplicationController
  def update
    @timer = current_user.timers.find(params[:id])
    @timer.toggle
    redirect_to root_path
  end
end
