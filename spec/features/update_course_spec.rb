require "rails_helper"

RSpec.feature "update course", :type => :feature do
  scenario "User updates a course" do

    ## User sign in
    visit '/users/sign_in'
    
    fill_in 'Email', :with => "someone@example.com"
    fill_in 'Password', :with => "password"

    click_on 'Log in'

    ## Update course
    visit '/courses/1/edit'
    
    select "Preparatory", from: 'Category'
    fill_in "Name", :with => "Intro to C++"
    fill_in "Description", :with => "This course is an intro to C++."
    click_button "Submit!"

    expect(page).to have_text("Course was succesfully updated.")
  end
end
