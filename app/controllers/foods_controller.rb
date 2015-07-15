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
    else
      render :new
    end
    respond_to do |format|
      format.html { redirect_to user_foods_path(@user, @food) }
      format.js
    end
  end

  def edit
    @user = current_user
    @food = Food.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @food = Food.find(params[:id])
    if @food.update(food_params)
      flash[:notice] = @food.name + ' has been updated.'
    else
      render :edit
    end
    respond_to do |format|
      format.html { redirect_to user_foods_path(@user, @food) }
      format.js
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @food = Food.find(params[:id])
    @food.destroy
    flash[:notice] = @food.name + " has been removed."
    respond_to do |format|
      format.html { redirect_to user_foods_path(@user, @food) }
      format.js
    end
  end

  def sum
    @user = User.find(params[:id])
    @sum = @user.foods.sum(:calories)
  end

  private
  def food_params
    params.require(:food).permit(:name, :calories, :user_id => current_user.id)
  end

end
