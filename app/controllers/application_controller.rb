class ApplicationController < ActionController::Base
  include Pundit
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_new_courses

  def set_new_courses
    @course = Course.new
  end

  def render_not_found(status=:not_found)
    render plain: "#{status.to_s.titleize} :(", status: status
  end  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :first_name, :last_name])
  end
  

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
