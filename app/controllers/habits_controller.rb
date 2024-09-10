class HabitsController < ApplicationController
  def index
    @habits = Habit.all
  end

  def new 
    @habit = Habit.new
  end

  def create 
    @habit = Habit.new(habit_params)
    if (@habit.save)
      redirect_to habits_path, notice: "Hooray!🥳 New habit was created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def habit_params 
    params.require(:habit).permit(:name)
  end
end
