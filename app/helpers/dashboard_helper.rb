module DashboardHelper
  def resource_name
    current_user || :user
  end

  def resource
    @resource ||= current_user
  end
end
