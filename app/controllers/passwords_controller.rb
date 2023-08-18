class PasswordsController < ApplicationController
    before_action :required_user_logged_in!
    def edit
    end


    def update
        if Current.user.update(password_params)
            redirect_to home_path, notice: "update password is successffully"
        else
            render :edit
        end
    end


    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end
