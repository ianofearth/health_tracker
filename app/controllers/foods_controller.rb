class FoodsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @food = @user.foods.new
  end

  def create
    @user = User.find(params[:user_id])
    @food = @user.foods.new(food_params)
    if @food.save
      flash[:notice] = "Food added."
      redirect_to '/'
    else
      render :new
    end
  end

  private
  def food_params
    params.require(:food).permit(:name, :calories, :user_id => current_user.id)
  end

end
