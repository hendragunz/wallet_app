class Users::SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "Login failed"
      redirect_to users_login_path
    end
  end

  def destroy
    flash[:alert] = "Successfully logged out"
    session[:user_id] = nil
    redirect_to root_path
  end
end
