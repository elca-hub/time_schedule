class ApplicationController < ActionController::Base
  include ErrorMessage
  before_action :configure_permitted_parameters, if: :devise_controller? 
  before_action :get_view_error

  def after_sign_in_path_for(resource)
    "/users/"
  end

  private
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:name, :icon])
      devise_parameter_sanitizer.permit(:account_update,keys:[:name, :icon])
    end
end
