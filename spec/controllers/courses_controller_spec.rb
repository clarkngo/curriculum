require 'rails_helper'

 RSpec.describe CoursesController, type: :controller do


  ## index
  describe "courses#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end


  ## new
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

  ## create
  describe "courses#create action" do
    it "should require users to be logged in" do
      post :create, params: { 
        course: { 
            category: 'Preparatory',
            name: 'Introduction to Computer Science',
            description: 'This course is an introduction to computer science.'
        } 
      }
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully create a new course in our database" do
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
      expect(course.user).to eq(user)
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



  ## edit
  describe "courses#edit action" do
    it "shouldn't let a user who did not create the course edit a course" do
      course = FactoryBot.create(
        course: { 
          category: 'Preparatory',
          name: 'Introduction to Computer Science',
          description: 'This course is an introduction to computer science.'
        } 
      )
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
      course = FactoryBot.create(
        course: { 
          category: 'Preparatory',
          name: 'Introduction to Computer Science',
          description: 'This course is an introduction to computer science.'
        } 
      )
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

  ## update
  describe "courses#update action" do
    it "shouldn't let users who didn't create the course update it" do
      course = FactoryBot.create(:course)
      user = FactoryBot.create(:user)
      sign_in user
      patch :update, params: { id: course.id, 
        course: { 
          category: 'Preparatory',
          name: 'Introduction to Computer Science',
          description: 'This course is an introduction to computer science.'
        } 
      }
      expect(response).to have_http_status(:forbidden)
    end  

    it "shouldn't let unauthenticated users update a course" do
      course = FactoryBot.create(:course)
      patch :update, params: { id: course.id, 
        course: { 
          category: 'Preparatory',
          name: 'Introduction to Computer Science',
          description: 'This course is an introduction to computer science.'
        } 
      }
      expect(response).to redirect_to new_user_session_path
    end

    it "should allow users to successfully update courses" do
      course = FactoryBot.create(
        course: { 
          category: 'Preparatory',
          name: 'Introduction to Computer Science',
          description: 'This course is an introduction to computer science.'
        } 
      )
      sign_in course.user
      
      patch :update, params: { id: course.id, 
        course: { 
          category: 'Core',
          name: 'Data Structures and Algorithms',
          description: 'This course is about Data Structures and Algorithms.'
        } 
      }
      expect(response).to redirect_to root_path
      course.reload
      expect(course.name).to eq "Data Structures and Algorithms"
    end

    it "should have http 404 error if the course cannot be found" do
      user = FactoryBot.create(:user)
      sign_in user

      patch :update, params: { id: "YOLOSWAG", 
        course: { 
          category: 'Core',
          name: 'Data Structures and Algorithms',
          description: 'This course is about Data Structures and Algorithms.'
        } 
      }
      expect(response).to have_http_status(:not_found)
    end

    it "should render the edit form with an http status of unprocessable_entity" do
      course = FactoryBot.create(
        course: { 
          category: 'Preparatory',
          name: 'Introduction to Computer Science',
          description: 'This course is an introduction to computer science.'
        } 
      )
      sign_in course.user
      
      patch :update, params: { id: course.id, 
        course: { 
          category: '',
          name: '',
          description: ''
        } 
      }
      expect(response).to have_http_status(:unprocessable_entity)
      course.reload
      expect(course.message).to eq "Initial Value"
    end
  end  
 end
 