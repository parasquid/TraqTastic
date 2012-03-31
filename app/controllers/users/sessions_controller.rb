class Users::SessionsController < Devise::SessionsController
  def new
    #redirect_to omniauth_authorize_path(resource_name, :facebook)
  end

end
