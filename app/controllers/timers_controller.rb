class TimersController < ApplicationController
  def update
    @timer = current_user.timers.find(params[:id])
    if params[:timer]
      @timer.update_attributes(params[:timer])
    else
      @timer.toggle
    end
    respond_with(@timer)
  end
  def show
    @timer = current_user.timers.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { }
    end
  end
  def edit
    @timer = current_user.timers.find(params[:id])
  end
end
