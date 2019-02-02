require "rails_helper"

RSpec.feature "update course", :type => :feature do
  scenario "User updates a course" do

    ## User sign in

    # arrange
    user = create(:user)

    visit '/users/sign_in'
    
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    # assert
    expect(page).to have_xpath('/')



    # act
    click_on 'Log in'

    click_on 'Suggest New Course'
    # act

    ## Create new course
    select('Preparatory', from: 'Category')
    fill_in "Name", :with => "Intro to Java"
    fill_in "Description", :with => "This course is an intro to Java."
    click_button "Submit!"

    ## Updating a course 
    fill_in "Name", :with => "Intro to C++"
    fill_in "Description", :with => "This course is an intro to C++."
    click_button "Submit!"

    expect(page).to have_text("Course was succesfully updated.")
  end
end
