class ApplicationController < ActionController::Base
        before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller? 
        protect_from_forgery with: :exception


        protected

                def configure_permitted_parameters
                        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
                        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :currnet_password) }
                end
        
end