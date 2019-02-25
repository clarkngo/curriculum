require 'rails_helper'

RSpec.feature "user adds a course process", type: :feature do
  scenario 'user adds a course' do

    # arrange
    user = FactoryBot.create(:user)
    category = FactoryBot.create(:category)

    visit '/'
    click_on 'Sign in'

    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password

    click_on 'Log in'
    
    visit new_course_path

    select("Preparatory", :from => "Category", :match => :prefer_exact)
    fill_in 'Name', :with => "Intro to ML", :match => :prefer_exact
    fill_in 'Description', :with => "This course is an introduction to ML.", :match => :prefer_exact
    attach_file('Upload course photo thumbnail', Rails.root + 'spec/fixtures/images/default-course-photo-50x50.jpg', :match => :prefer_exact)
    attach_file('Upload course photo header', Rails.root + 'spec/fixtures/images/default-course-photo-1110x624.38.jpg', :match => :prefer_exact)

    # act    
    click_on 'Submit!', :match => :prefer_exact

    # assert
    expect(Course.last.name).to eq("Intro to ML")
    expect(page).to have_text("Successfully added a course!")
  end
end
