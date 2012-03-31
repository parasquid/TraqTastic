class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  respond_to :html, :json
end
