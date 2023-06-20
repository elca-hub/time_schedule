class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 
  before_action :is_dark_mode

  def after_sign_in_path_for(resource)
    "/users/"
  end

  def is_dark_mode
    hour = Time.now.in_time_zone('Tokyo').hour
    start_hour = 18
    finish_hour = 6

    @is_dark_mode = hour >= start_hour || hour < finish_hour
  end

  private
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:name, :icon])
      devise_parameter_sanitizer.permit(:account_update,keys:[:name, :icon])
    end
end
