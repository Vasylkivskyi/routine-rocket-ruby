class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to habits_path
    else
      render :home
    end
  end
end
