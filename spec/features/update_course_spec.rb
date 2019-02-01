require 'rails_helper'

RSpec.describe coursesController, type: :controller do
  describe "courses#update action" do
    it "shouldn't let users who didn't create the course update it" do
      course = FactoryBot.create(:course)
      user = FactoryBot.create(:user)
      sign_in user
      patch :update, params: { id: course.id, course: { category: 'Preparatory', name: 'Intro to Data Structures and Algorithms', description: 'This course is an introduction to Data Structures and Algorithms.'} }
      expect(response).to have_http_status(:forbidden)
    end  

    it "shouldn't let unauthenticated users update a course" do
      course = FactoryBot.create(:course)
      patch :update, params: { course: { category: 'Preparatory', name: 'Intro to Data Structures and Algorithms', description: 'This course is an introduction to Data Structures and Algorithms.'} }
      expect(response).to redirect_to new_user_session_path
    end

    it "should allow users to successfully update courses" do
      course = FactoryBot.create(:course, message: "Initial Value")
      sign_in course.user
      
      patch :update, params: { id: course.id, course: { message: 'Changed' } }
      expect(response).to redirect_to root_path
      course.reload
      expect(course.message).to eq "Changed"
    end

    it "should have http 404 error if the course cannot be found" do
      user = FactoryBot.create(:user)
      sign_in user

      patch :update, params: { id: "YOLOSWAG", course: { message: 'Changed' } }
      expect(response).to have_http_status(:not_found)
    end

    it "should render the edit form with an http status of unprocessable_entity" do
      course = FactoryBot.create(:course, message: "Initial Value")
      sign_in course.user
      
      patch :update, params: { id: course.id, course: { message: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      course.reload
      expect(course.message).to eq "Initial Value"
    end
  end

  describe "courses#edit action" do
    it "shouldn't let a user who did not create the course edit a course" do
      course = FactoryBot.create(:course)
      user = FactoryBot.create(:user)
      sign_in user
      get :edit, params: { id: course.id }
      expect(response).to have_http_status(:forbidden)
    end

    it "shouldn't let unauthenticated users edit a course" do
      course = FactoryBot.create(:course)
      get :edit, params: { id: course.id }
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully show the edit form if the course is found" do
      course = FactoryBot.create(:course)
      sign_in course.user
    
      get :edit, params: { id: course.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error message if the course is not found" do
      user = FactoryBot.create(:user)
      sign_in user

      get :edit, params: { id: 'SWAG' }
      expect(response).to have_http_status(:not_found)
    end
  end
end
