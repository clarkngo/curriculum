require 'rails_helper'

 RSpec.describe CoursesController, type: :controller do
  describe "courses#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

   describe "courses#new action" do    
    it "should require users to be logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

     it "should successfully show the new form" do
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

   it "should require users to be logged in" do
    post :create, params: { gram: { message: "Hello" } }
    expect(response).to redirect_to new_user_session_path
  end

   it "should successfully create a new gram in our database" do
    user = FactoryBot.create(:user)
    sign_in user

     post :create, params: { 
      course: { 
          category: 'Preparatory',
          name: 'Introduction to Computer Science',
          description: 'This course is an introduction to computer science.'
        } 
      }
    expect(response).to redirect_to root_path

     course = Course.last
    expect(course.category).to eq("Preparatory")
    # enable below code after integrating user to courses
    # expect(course.user).to eq(user)
  end

   it "should properly deal with validation errors" do
    user = FactoryBot.create(:user)
    sign_in user

    course_count = Course.count
    post :create, params: { course: { message: '' } }
    expect(response).to have_http_status(:unprocessable_entity)
    expect(course_count).to eq Course.count
  end

 end
 