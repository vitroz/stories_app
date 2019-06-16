class RegistrationsController < Devise::RegistrationsController

  private

    # Modified Devise params for user login
    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role)
    end

    def after_sign_up_path_for(resource)
      "/stories"
    end

end
