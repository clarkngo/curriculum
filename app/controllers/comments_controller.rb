class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @course = Course.find(params[:course_id])
    @comment = @course.comments.build(comment_params.merge(user: current_user))

    if @comment.save
      flash[:success] = "Successfully added a comment!"  
    else
      flash[:error] = "Unable to add blank comment!" 
    end
    
    redirect_to request.referrer
  end

  def destroy
    @comment = Comment.find(params[:id])
    redirect_to request.referrer, :flash => { :error => "Insufficient rights!" } if @comment.user != current_user

    @comment.destroy
    flash[:success] = "Successfully deleted a comment!"
    redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
