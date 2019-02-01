class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.build(course_params)

    if @course.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def destroy
    @course = Course.find(params[:id])
    return render_not_found if @course.blank?
    return render_not_found(:forbidden) if @course.user != current_user
    @course.destroy
    redirect_to root_path
  end

  private

  def course_params
    params.require(:course).permit(:category_id, :name, :description, :user_id)
  end
end
