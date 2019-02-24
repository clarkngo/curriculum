class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @courses = Course.search(params[:term])
  end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.build(course_params)

    if @course.save
      flash[:success] = "Successfully added a course!"
      redirect_to course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @course = Course.find(params[:id])
    @comment = Comment.new
    @avatar = @course.user.avatar if @course.user.present?
  end

  def destroy
    @course = Course.find(params[:id])
    redirect_to course_path(@course), :flash => { :error => "Insufficient rights!" } if @course.user != current_user

    @course.destroy
    flash[:success] = "Successfully deleted a course!"
    redirect_back(fallback_location: root_path)
  end

  def edit
    @course = Course.find_by_id(params[:id])
    return render_not_found if @course.blank?
    redirect_to course_path(@course), :flash => { :error => "Insufficient rights!" } if @course.user != current_user
  end
    
  def update
    @course = Course.find_by_id(params[:id])
    return render_not_found if @course.blank?
    redirect_to course_path(@course), :flash => { :error => "Insufficient rights!" } if @course.user != current_user
    @course.update_attributes(course_params)
    
    if @course.valid?
      flash[:success] = "Course was succesfully updated."
      redirect_to course_path(@course)
    else
      return render :edit, status: :unprocessable_entity
    end
  end
    
  private

  def course_params
    params.require(:course).permit(:category_id, :name, :description, :photo, :photo_header, :user_id, :favorited)
  end
end
