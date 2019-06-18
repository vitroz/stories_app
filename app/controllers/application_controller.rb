class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:organization_id])
  end

  private
 
    def after_sign_in_path_for(resource)
       "/stories"
    end

    def after_sign_out_path_for(resource)
       "/"
    end
end
