class WelcomeController < ApplicationController
  def index
    @reports = current_user.reports.all
  end
end
