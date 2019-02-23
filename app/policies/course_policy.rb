class CoursePolicy

  def index?
    @user
  end

  def show?
    @user
  end

  def create?
    @user
  end

  def new?
    @user
  end

  def update?
    @user && @user.course == @course
  end

  def edit?
    @user && @user.course == @course
  end

  def destroy?
    @user && @user.course == @course
  end
end
