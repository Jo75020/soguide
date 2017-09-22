class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?



  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo, :photo_cache, :year_of_birth, :postal, :inscription_reason, :email])

    # For additional in app/views/devise/registrations/edit.html.erb
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end



  def authorize_admin
      redirect_to root_path, status: 401 unless current_user.admin
  end



  def get_message_unread

    @unread_messages = Message.unread_by(current_user)

  end


end
