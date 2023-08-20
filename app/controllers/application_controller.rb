class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?


    protected

    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:           [:name,:nickname, :phone, :avatar,:address])
    devise_parameter_sanitizer.permit(:account_update, keys:    [:name,:nickname, :phone, :avatar,:address])
    end

    def authorize_request(kind = nil)
        if current_btouser && kind && !kind.include?(current_btouser.role)
          redirect_to posts_path, notice: "No estás autorizado para realizar esta acción."
        end
    end

end
