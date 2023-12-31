class ApplicationController < ActionController::Base
    before_action :set_current_user

    before_action :set_query

   
    def set_query
        @query = Player.ransack(params[:q])
    end  

    def set_current_user
      if session[:user_id]
        Current.user=User.find_by(id: session[:user_id])
      end
    end

    def required_user_logged_in!
        redirect_to sign_in_path, alert: "you must be signed in to do that" if Current.user.nil?
    end
end
