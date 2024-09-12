class HabitsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_habit, only: %w[edit update]
  def index
    @habits = current_user.habits.all
  end

  def new
    @habit = current_user.habits.new
  end
  
  def create 
    @habit = current_user.habits.new(habit_params)
    if (@habit.save)
      redirect_to habits_path, notice: "Hooray!🥳 Your new habit was created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
  end

  def update
    if @habit.update(habit_params)
      redirect_to @habit, notice: "Your habit was updated!" 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  
  def habit_params 
    params.require(:habit).permit(:name)
  end

  def find_habit 
    @habit = current_user.habits.find(params[:id])
  end
end
