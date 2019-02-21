class HomesController < ApplicationController
  def index
    @course_latest = Course.last
    @course_second_latest = Course.last(2).first
    @course_third_latest = Course.last(3).first
  end
end
