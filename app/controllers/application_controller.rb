class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_in_path_for(resource)
		if end_user_signed_in?
			items_path
		elsif admin_singned_in?
			orders_path
		end
	end

	def after_sign_out_path_for(resource)
  		items_path
	end


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

	private


	# def check_admin
 #  		if user_signed_in?
 #    		if current_admin_user.name != 'admin'
 #      			redirect_to root_path
 #      			flash[:notice] = "管理者のみ閲覧できます"
 #    		end
 #  		end
	# end

end