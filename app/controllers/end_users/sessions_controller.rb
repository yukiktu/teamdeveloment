# frozen_string_literal: true

class EndUsers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
    # before_action :end_user_check, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    user = EndUser.find_by(email: params[:end_user][:email])
    if user.enrollment_status == 0
      flash[:notice] = ""
      redirect_to end_user_session_path
    else
      super
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  # def end_user_check
  #   unless admin_signed_in?
  #     if end_user_signed_in? && current_end_user.enrollment_status == 0
  #       flash[:notice] = ""
  #       redirect_to end_user_session_path
  #     end
  #   end
  # end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
