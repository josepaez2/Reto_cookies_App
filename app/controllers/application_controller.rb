class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception#, prepend:true
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

	# def configure_permitted_parameters
  # end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :content, :expiration_date, :seen_status])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:content, :expiration_date, :seen_status])
  end
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name])
  #   devise_parameter_sanitizer.permit(:sign_up) do |announcement_params|
  #     announcement_params.permit(:content, :expiration_date, :seen_state)
	 #  # devise_parameter_sanitizer.permit(:sign_up) do |user_params|
	 #  #   user_params.permit(:email, :name, :last_name)
	 #  # end
  #   end
  # end
end
