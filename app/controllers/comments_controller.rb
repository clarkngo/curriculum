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
    
    redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end

end
