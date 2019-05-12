ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :avatar, :first_name, :last_name

  # override User form
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
    end
    f.actions
  end
end
