class TimersController < ApplicationController
  def update
    @timer = current_user.timers.find(params[:id])
    @timer.toggle
    respond_with(@timer, location: root_path)
  end
end
