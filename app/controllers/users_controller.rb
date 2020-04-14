class UsersController < ApplicationController
    before_action :find_user, only: [:home]

    def new
        @user = User.new
    end

    def home
    end

    def show #profile
    end

    def create
        @user = User.new(user_params)

        if @user.save
            binding.pry
            session[:user_id] = @user.id 
            # flash[:message] = "Successfully Created your Account" research flash messages
            redirect_to home_path
        else
            # flash[:error] = "You suck"
            render "new"
        end
    end

    private

    def find_user
        @user = User.find(session[:user_id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password_digest)
    end
end
