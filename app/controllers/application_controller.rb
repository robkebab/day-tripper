class ApplicationController < ActionController::Base

#==================== REMOVE =======================
    def hard_code_session
        session[:user_id] = User.third.id
    end
#====================================================
   
    def current_user
        User.find(session[:user_id])
    end

    def logged_in?
        !!session[:user_id]
    end

end
