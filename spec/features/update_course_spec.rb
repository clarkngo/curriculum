require "rails_helper"

RSpec.feature "update course", :type => :feature do
  scenario "User updates a course" do

    ## User sign in

    # arrange
    user = create(:user)

    visit '/users/sign_in'
    
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    # act
    click_on 'Log in'

    # assert
    expect(page).to have_content 'Success Signed in successfully.'

    ## Updating a course 

    visit "/courses/14/edit"

    select('Preparatory', from: 'Category')
    fill_in "Name", :with => "Intro to Java"
    fill_in "Description", :with => "This course is an intro to Java."
    click_button "Submit!"

    expect(page).to have_text("Course was succesfully updated.")
  end
end
