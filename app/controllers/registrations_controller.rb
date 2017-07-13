class RegistrationsController < Devise::RegistrationsController
  private
    def sign_up_params
      params.require(:user).permit(:email, :username, :firstname, :lastname, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:email, :username, :firstname, :lastname, :password, :password_confirmation)
    end

    def after_sign_up_path_for(resource)
      '/alerts-listing'
    end
end
