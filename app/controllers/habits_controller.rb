class HabitsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_habit, only: %w[edit update]
  def index
    @habits = Habit.all
  end

  def new
    @habit = Habit.new
  end
  
  def create 
    @habit = Habit.new(habit_params)
    if (@habit.save)
      redirect_to habits_path, notice: "Hooray!🥳 Your new habit was created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
    @habit = Habit.find(params[:id])
  end

  def update
    @habit = Habit.find(params[:id])
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
    @habit = Habit.find(params[:id])
  end
end
