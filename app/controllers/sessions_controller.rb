class SessionsController < ApplicationController
  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = "Logged in."
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "Problems."
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out."
    redirect_to "/"
  end
end
