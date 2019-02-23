class HomesController < ApplicationController
  def index
    @course_latest = Course.last
    @courses_except_last = Course.where.not(id: @course_latest)
  end
end
