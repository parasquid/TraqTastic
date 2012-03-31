class Users::SessionsController < Devise::SessionsController
  def new
    unless current_user.signed_in?
      redirect_to omniauth_authorize_path(resource_name, :facebook)
    end
  end

end
