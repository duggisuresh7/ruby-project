class SessionsController < ApplicationController
   
    def new
    end


    def create
        user=User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id]=user.id
            redirect_to home_path, notice: "logged in successsfully"
        else
            flash[:alert]="invalid email or password"
        end
    end


    def destory
        session[:user_id]=nil
        redirect_to home_path,notice: "logged out"
    end
end