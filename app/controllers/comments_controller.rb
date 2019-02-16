class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @course = Course.find(params[:course_id])
    @comments = @course.comments.build(comment_params.merge(user: current_user))

    if @comments.save
      flash[:success] = "Successfully added a comment!"  
    else
      flash[:error] = "Unable to add blank comment!" 
    end
    
    redirect_to course_path(@course)
  end

  def edit
    @comment = Comment.find_by_id(params[:id])
    @course = @comment.course
    return render_not_found if @comment.blank?
    return render_not_found(:forbidden) if @comment.user != current_user
  end
    
  def update
    @comment = Comment.find_by_id(params[:id])
    @course = @comment.course
    return render_not_found if @comment.blank?
    return render_not_found(:forbidden) if @comment.user != current_user
    @comment.update_attributes(comment_params)
    
    if @comment.valid?
      flash[:success] = "Comment was succesfully updated."
      redirect_to dashboard_index_path
    else
      return render :edit, status: :unprocessable_entity
    end
  end
    
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @comment.destroy
    flash[:success] = "Successfully deleted a comment!"
    redirect_to dashboard_index_path
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
