class ApplicationPolicy
  attr_reader :current_user, :course

  def initialize(current_user, course)
    @user = current_user
    @course = course
  end
end
