class SessionsController < ApplicationController
  def new
  end

  def create
    #binding.pry
    @user = User.find_by(email: params[:email])
      binding.pry
    if @user && @user.authenticate(params[:password])
   session[:user_id] = @user.id
   redirect_to home_path
    else
      flash.now[:notice] = "Invalid Username or Password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
