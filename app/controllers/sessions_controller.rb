class SessionsController < ApplicationController
  layout false

  def new
    redirect_to root_path if logged_in?
  end
  
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:warning] = "Invalid username or password!"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "You have successfully logged out"
    redirect_to login_path
  end
end
