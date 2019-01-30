class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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

  def show
    @course = Course.find(params[:id])
  end

  private

  def course_params
    params.require(:course).permit(:category, :name, :description)
  end
end
