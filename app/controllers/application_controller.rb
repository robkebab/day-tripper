class ApplicationController < ActionController::Base
       
    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        end
    end

    def logged_in?
        !!current_user
    end

    def authorize
        redirect_to root_path if !logged_in?
    end 

end
