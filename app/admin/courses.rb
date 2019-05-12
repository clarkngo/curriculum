ActiveAdmin.register Course do
  permit_params :user_id, :category_id, :name, :description, :photo, :photo_header, :favorited
end
