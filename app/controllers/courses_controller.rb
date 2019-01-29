class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create(course_params)
    if @course.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end    
  end

  private

  def course_params
    params.require(:course).permit(:category, :name, :description)
  end
end
