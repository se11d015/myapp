class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin!
    if current_user.role != "admin"
        redirect_to '/'
    end
  end

end
