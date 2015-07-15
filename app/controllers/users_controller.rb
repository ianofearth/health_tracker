class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome"
      redirect_to '/'
    else
      flash[:alert] = 'There was a problem creating your account. Please try again.'
      redirect_to :back
    end
  end

  def edit

  end

  def update

  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
