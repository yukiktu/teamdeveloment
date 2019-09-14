class ApplicationController < ActionController::Base


def after_sign_in_path_for(resource)
	user_path(current_user)
end

	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,
			                                               :first_name,
			                                               :kana_last_name,
			                                               :kana_first_name,
			                                               :postal_code,
			                                               :address,
			                                               :phone_number,
			                                               :mail_address,
			                                               :password,
			                                               :enrollment_status,
			                                               :updated_at,
			                                               :created_at ])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:mail_address,
		                                                   :password])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name])

	end
end



