class SessionsController < Devise::SessionsController
  private
    # def sign_in_params
    #   params.require(:user).permit(:email, :password, :remember_me)
    # end

    def after_sign_in_path_for(resource)
      '/alerts'
    end

    def after_sign_out_path_for(resource)
      '/'
    end
end
