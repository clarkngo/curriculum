ActiveAdmin.register Comment do
  permit_params :message, :user_id, :course_id
end
