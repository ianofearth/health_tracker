class ExercisesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @exercise = @user.exercises.new
  end

  def create
    @user = User.find(params[:user_id])
    @exercise = @user.exercises.new(exercise_params)
    if @exercise.save
      flash[:notice] = "Exercise added."
    else
      render :new
    end
    respond_to do |format|
      format.html { redirect_to user_exercises_path(@user, @exercise) }
      format.js
    end
  end

  def edit
    @user = current_user
    @exercise = Exercise.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @exercise = Exercise.find(params[:id])
    if @exercise.update(exercise_params)
      flash[:notice] = @exercise.name + ' has been updated.'
    else
      render :edit
    end
    respond_to do |format|
      format.html { redirect_to user_exercises_path(@user, @exercise) }
      format.js
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    flash[:notice] = @exercise.name + " has been removed."
    respond_to do |format|
      format.html { redirect_to user_exercises_path(@user, @exercise) }
      format.js
    end
  end

  private
  def exercise_params
    params.require(:exercise).permit(:name, :burned, :user_id => current_user.id)
  end

end
