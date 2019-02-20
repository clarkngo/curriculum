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
      flash[:success] = "Successfully added a course!"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @course = Course.find(params[:id])
    @comment = Comment.new
    @avatar = @course.user.avatar
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @course.destroy
    flash[:success] = "Successfully deleted a course!"
    redirect_to root_path
  end

  def edit
    @course = Course.find_by_id(params[:id])
    return render_not_found if @course.blank?
    return render_not_found(:forbidden) if @course.user != current_user
  end
    
  def update
    @course = Course.find_by_id(params[:id])
    return render_not_found if @course.blank?
    return render_not_found(:forbidden) if @course.user != current_user
    @course.update_attributes(course_params)
    
    if @course.valid?
      flash[:success] = "Course was succesfully updated."
      redirect_to root_path
    else
      return render :edit, status: :unprocessable_entity
    end
  end
    
  private

  def course_params
    params.require(:course).permit(:category_id, :name, :description, :photo, :user_id)
  end
end
