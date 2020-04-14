class SessionsController < ApplicationController
  def new
  end

  def create
    #binding.pry
    @user = User.find_by(email: params[:email])

    if @user
   session[:user_id] = @user.id
   redirect_to home_path
    else
      flash[:notice] = "You not on the list fam."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
