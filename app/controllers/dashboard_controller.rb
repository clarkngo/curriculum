class DashboardController < ApplicationController
  def index
    if current_user
      @comments = current_user.comments
      @courses = current_user.courses
    end
  end
  
end
